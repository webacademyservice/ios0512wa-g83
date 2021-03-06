//
//  AppDelegate.swift
//  HelloApp
//
//  Created by Mykhailo Vorontsov on 12/12/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        /*
         Добавлена новая "схема" выполнения аппки. Называется  `Mock HelloApp`.

         (Когда выбираете симулятор, можно редаткировать схему "", или создать новую.)

         Схема скоприрована из основной схемы, но добавлены "enviroment variable" `mockService`: `true`

         Теперь при выборе симулятора можно выбрать схему запуска, и при запуске `Mock HelloApp` DependecyManager будет настроен с сервисом-заглушкой
         */

        let networkController = NetworkController(host: "https://api.thecatapi.com", apiKey: "some_random_key")

        if let envVar = ProcessInfo.processInfo.environment["mockService"], Bool(envVar) == true {

            // Зарегестрировать с сервисом-заглушкой
            DependencyManager.register(
                storageService: MockStorage(),
                networkController: networkController
            )

        } else if let envVar = ProcessInfo.processInfo.environment["ClassicService"], Bool(envVar) == true {

            // Зарегестрировать с сервисом-заглушкой
            DependencyManager.register(
                storageService: StorageService(),
                networkController: networkController
            )

        } else if let envVar = ProcessInfo.processInfo.environment["FileService"], Bool(envVar) == true {

            // Зарегестрировать с file сервисом
            DependencyManager.register(
                storageService: FileService(name: "pets"),
                networkController: networkController
            )
        } else {

            let imageController = ImageController(
                fetch: networkController,
                cache: ImageCacheController(name: "image")
            )

            DependencyManager.register(
                storageService: NetworkStorageService(
                    networkController: networkController,
                    imageLoadingController: imageController
                ),
                networkController: networkController
            )

        }
        return true
    }
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

