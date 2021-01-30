//
//  NetoworkStorageService.swift
//  HelloApp
//
//  Created by Mykhailo Vorontsov on 23/01/2021.
//

import Foundation

class NetworkStorageService: StorageServiceProtocol {

    let networkController: NetworkControllerProtocol
    let imageLoadingController: ImageLoading

    init(networkController: NetworkControllerProtocol, imageLoadingController: ImageLoading) {
        self.networkController = networkController
        self.imageLoadingController = imageLoadingController
    }

    // Преобзраование декодированых петов в петов модели
    private func mapPetsAndLoadImages(pets: [DecodingPet]) -> [Pet] {

        var results: [Pet] = []

        // Создаем группу для сихронизации
        let group = DispatchGroup()

        // Перебераем всех петов в ответе
        for each in pets {
            // Конвертируем темперамент в массив тегов
            let tags = each.temperament.components(separatedBy: .punctuationCharacters)

            // Если картинки нет = просто добавляем пета без картинки в результат
            guard let url = each.image?.url else {
                results.append(
                    Pet(
                        name: each.name,
                        shortDescription: each.description,
                        image: nil,
                        tags: tags
                    )
                )
                continue
            }

            // Если есть адрес картинки - заходи в группу ожидания
            group.enter()

            // Запускаем асинхронный запрос на загрузку картинки
            self.imageLoadingController.fetchImage(url: url) { (result) in
                // Когда получили ответ на загрузку картинки
                let image = try? result.get()

                // Добавляет в результат Пета с загруженой картинкой
                results.append(
                    Pet(
                        name: each.name,
                        shortDescription: each.description,
                        image: image,
                        tags: tags
                    )
                )
                // И выходим из ожидания
                group.leave()
            }
        }

        // Ждем когда все зашедьшие в группу, из нее вышли. Если выполнять эту комманду в последовательной очереди - то очередь блокируется.
        group.wait()

        // Обратите внимание - петы добавляются в резултата не в том порядке, как мы их получили в ответе (как было раньше - по алфавиту)
        // а в порядке обработки цикла из загрузки картинок.

        return results

    }

    func loadPets(callback: @escaping ((Result<[Pet], Error>) -> ())) {
        networkController.fetch(type: [DecodingPet].self, path: "v1/breeds", parameters: nil) { [weak self] (result) in

            // Обработка - в конкурентной очереди. СМ строку (59)
            DispatchQueue.global(qos: .userInitiated).async {

                guard let self = self else { return }

                do {
                    let results = try result.get()
                    let pets = self.mapPetsAndLoadImages(pets: results)
                    self.allPets = pets
                    // Возврат - в мейн
                    DispatchQueue.main.async {
                        callback(.success(pets))
                    }
                } catch {
                    // Возврат ошибки - тоже в мейн
                    DispatchQueue.main.async {
                        callback(.failure(error))
                    }
                }
            }

        }

    }


    var allPets: [Pet] = []


}
