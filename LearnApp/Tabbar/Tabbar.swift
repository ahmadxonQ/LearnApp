//
//  Tabbar.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 12/06/24.
//


import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstVC = FirstViewController()
        let secondVC = SecondViewController()
        
        firstVC.tabBarItem = UITabBarItem(title: "First", image: nil, selectedImage: nil)
        secondVC.tabBarItem = UITabBarItem(title: "Second", image: nil, selectedImage: nil)
        
        
        viewControllers = [UINavigationController(rootViewController: firstVC),
                           UINavigationController(rootViewController: secondVC)]
    }
}
