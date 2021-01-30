//
//  ImageCaching.swift
//  HelloApp
//
//  Created by Mykhailo Vorontsov on 30/01/2021.
//

import Foundation

protocol ImageCaching {
    func cacheImage(_ image: Image, for: URL) throws
}

class ImageCacheController: ImageCaching, ImageLoading {

    enum CacheError: Error {
        case sandbox
        case notImageData
        case wrongData(Data)
    }

    let cacheName: String

    lazy var fileManager: FileManager = FileManager.default

    init(name: String) {
        cacheName = name
    }

    func cacheImage(_ image: Image, for url: URL) throws {
        // Получить имя файла
        let fileUrl = try cacheUrlFor(url: url)

        // Получить данные из картинки
        guard let data = image.pngData() else { throw CacheError.notImageData }

        // Записать данные в файл
        fileManager.createFile(atPath: fileUrl.relativePath, contents: data, attributes: nil)
//        data.write(to: fileUrl)
    }


    private func cacheUrlFor(url: URL) throws -> URL {

        guard let cachesUrl = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            throw CacheError.sandbox
        }

        let folderUrl = cachesUrl.appendingPathComponent(cacheName)

        // Создать папку если ее нет

        if !fileManager.fileExists(atPath: folderUrl.relativePath) {
            try fileManager.createDirectory(at: folderUrl, withIntermediateDirectories: true, attributes: nil)
        }

        let fileName = url.lastPathComponent
        let fileUrl = folderUrl
            .appendingPathComponent(fileName)
            .appendingPathExtension("png")

        return fileUrl
    }

    private func loadImage(url: URL) throws -> Image {
        // Получить имя файла
        let fileUrl = try cacheUrlFor(url: url)

        // Прочитать данные
        let data = try Data(contentsOf: fileUrl)

        // Создать картинку
        guard  let image = Image(data: data) else {
            throw CacheError.wrongData(data)
        }

        return image
    }

    func fetchImage(url: URL, callback: @escaping ((Result<Image, Error>) -> ())) {

        callback( Result { try loadImage(url: url) } )

    }

    
}
