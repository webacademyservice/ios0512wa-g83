//
//  ImageController.swift
//  HelloApp
//
//  Created by Mykhailo Vorontsov on 30/01/2021.
//

import Foundation

class ImageController: ImageLoading {

    let cacheController: ImageCaching & ImageLoading
    let fetchController: ImageLoading

    init(fetch: ImageLoading, cache: ImageCaching & ImageLoading) {
        cacheController = cache
        fetchController = fetch
    }


    func fetchImage(url: URL, callback: @escaping ((Result<Image, Error>) -> ())) {

        // Читаем кеш
        cacheController.fetchImage(url: url) { [weak self] (cacheResult) in

            do {
                let image = try cacheResult.get()
                callback(.success(image))
            } catch _ {
                // Если  не получилось - читаем из сети

                guard let self = self else { return }

                self.fetchController.fetchImage(url: url) { [weak self] netResult in

                    do {
                        let image = try netResult.get()
                        // Получилось из сети - записываем в кеш
                        try? self?.cacheController.cacheImage(image, for: url)
                        callback(.success(image))
                    } catch {
                        callback(.failure(error))
                    }
                }
            }
        }
    }



}
