//
//  SceneDelegate.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 28/05/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        let mainTabBarController = CustomEmojiExplorerViewController()
        window.rootViewController = UINavigationController(rootViewController: mainTabBarController)
        window.makeKeyAndVisible()
    }
    
}








