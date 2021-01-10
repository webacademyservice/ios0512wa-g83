//
//  DependencyManager.swift
//  HelloApp
//
//  Created by Mykhailo Vorontsov on 10/01/2021.
//

import Foundation

protocol  DependecyManaging {

    var storageService: StorageServiceProtocol { get }

}

/**
Менеджер зависомостей. При конфигурации задаются все зависимости.

 Использует шаблон-синглтон - т.е. только один менеджер может быть использован, и он доступен в любой точке проекта
 */
class DependencyManager: DependecyManaging {

    // MARK: переменные для хранения dependecies

    let storageService: StorageServiceProtocol

    // Скрытая переменная, которая содержит адрес "синглтона"
    private static var storedManager: DependecyManaging?

    /// Публичный переменная для доспупа к синглтону
    static var shared: DependecyManaging {

        guard let manager = self.storedManager else {
            // Если менеджер не зарегестрирован - аварийно завершить апку с сообщением об ошибке
            fatalError("manager not configured yet")
        }
        // Иначе - вернуть менеджер
        return manager
    }

    /// Зарегестрировать менеджер с указаными зависимостями
    /// - Parameter storageService: Севрвис хранения данных
    static func register(storageService: StorageServiceProtocol) {

        // Метод по умолчанию "internal" - т.е. его можно использовать в любой точке проекта.

        // Только внутри класса мы можем использовать приватный инициализатор
        storedManager = DependencyManager(storageService: storageService)
    }

    // Единственный объявленый инициализатор - приватный - т.е. объекты класса нельзя создать извне
    private init(storageService: StorageServiceProtocol) {
        self.storageService = storageService
    }

}
