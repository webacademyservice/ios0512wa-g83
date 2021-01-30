//
//  NetworkController.swift
//  HelloApp
//
//  Created by Mykhailo Vorontsov on 23/01/2021.
//

import Foundation

protocol NetworkControllerProtocol {

    func fetch<ResponseType: Decodable>(
        type: ResponseType.Type,
        path: String,
        parameters: [String: String]?,
        callback: @escaping ((Result<ResponseType, Error>)  -> ())
    )

    func post<PostType, ResponseType>(
        type: ResponseType.Type,
        path: String,
        parameters: [String : String]?,
        toSend: PostType,
        callback: @escaping ((Result<ResponseType, Error>) -> ())
    ) where PostType : Encodable, ResponseType: Decodable

}

class NetworkController: NetworkControllerProtocol {

    enum NetworkError: Error {
        case networkLayer(Error, data: Data?, response: URLResponse?)
        case wrongResponse(response: URLResponse?)
        case statusCode(code: Int, response: HTTPURLResponse)
        case noData(response: HTTPURLResponse)
        case decode(error: Error, data: Data)
        case notImage(Data)
    }

    let host: String
    let apiKey: String

    lazy var session: URLSession = { return URLSession.shared}()
    lazy var decoder: JSONDecoder = { return JSONDecoder() }()

    init(host: String, apiKey: String) {
        self.host = host
        self.apiKey = apiKey
    }

    func fetch<ResponseType>(type: ResponseType.Type, path: String, parameters: [String : String]?, callback: @escaping ((Result<ResponseType, Error>) -> ())) where ResponseType : Decodable {

        // Создаем запрос
        let urlRequest = makeRequest(path: path, parameters: parameters)

        // Создаем задачу
        let task = session
            .dataTask(with: urlRequest) { [weak self] (data, response, error) in
                // С блоком обработки ответа
                guard let self = self else { return }

                do {
                    let result: ResponseType = try self.process(data: data, response: response, error: error)
                    callback(.success(result))
                } catch {
                    callback(.failure(error))
                }

            }

        // !!! Не забываем отпарвить задачу на выполнение !!!
        task.resume()

    }

    // Пример функции для отпавки данных на сервер. Тут ожидается что сервер что-то вернет, хотя обычно при отправка данных сервер просто возвращзает 202 и не возвращает данные.
    func post<PostType, ResponseType>(
        type: ResponseType.Type,
        path: String,
        parameters: [String : String]?,
        toSend: PostType,
        callback: @escaping ((Result<ResponseType, Error>) -> ())
    ) where PostType : Encodable, ResponseType: Decodable {

        let data = try? JSONEncoder().encode(toSend)

        let urlRequest = makeRequest(path: path, parameters: parameters, bodyData: data, method: "POST")

        let task = session
            .dataTask(with: urlRequest) { [weak self] (data, response, error) in
                guard let self = self else { return }

                do {
                    let result: ResponseType = try self.process(data: data, response: response, error: error)
                    callback(.success(result))
                } catch {
                    callback(.failure(error))
                }

            }

        // !!!!
        task.resume()

    }

    // Загрузка картинки. Обратите внимания - хост не используется. Картинка загружается по полному адресу.
    func fetchImage(
        url: URL,
        callback: @escaping ((Result<Image, Error>)  -> ())
    ) {

        let task = session
            .dataTask(with: url) { [weak self] (data, response, error) in
                guard let self = self else { return }

                do {
                    let image = try self.processImage(data: data, response: response, error: error)
                    callback(.success(image))
                } catch {
                    callback(.failure(error))
                }

            }

        // !!!!
        task.resume()
    }

    // Сизхнроный блок базовой обработки ответа до момента, где нам нужны данные
    private func processData(data: Data?, response: URLResponse?, error: Error?) throws -> Data {
        if let error = error {
            throw NetworkError.networkLayer(error, data: data, response: response)
        }

        guard  let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.wrongResponse(response: response)
        }

        guard (200..<300).contains(httpResponse.statusCode) else {
            throw NetworkError.statusCode(code: httpResponse.statusCode, response: httpResponse)
        }

        guard let data = data, data.count > 0 else {
            throw NetworkError.noData(response: httpResponse)
        }

        return data
    }

    // Сихнронный блок обработки JSON ответа
    private func process<ResponseType: Decodable>(data: Data?, response: URLResponse?, error: Error?) throws -> ResponseType {
        let data = try processData(data: data, response: response, error: error)

        do {
            let result = try decoder.decode(ResponseType.self, from: data)
            return result
        } catch {
            throw NetworkError.decode(error: error, data: data)
        }
    }

    // Синхронные блок обработка Картинки
    private func processImage(data: Data?, response: URLResponse?, error: Error?) throws -> Image {

        let data = try processData(data: data, response: response, error: error)

        if let result = Image(data: data) {
            return result
        } else {
            throw NetworkError.notImage(data)
        }
    }

    private func makeRequest(path: String, parameters: [String : String]?, bodyData: Data? = nil, method: String = "GET") -> URLRequest {


        let baseUrl = URL(string: host)!
        var fullUrl: URL = baseUrl.appendingPathComponent(path)
        // Тут надо добавить параметры

        var request = URLRequest(url: fullUrl)
        
        request.addValue(apiKey, forHTTPHeaderField: "x-api-key")
        request.httpMethod = method
        request.httpBody = bodyData

        return request
    }


}
