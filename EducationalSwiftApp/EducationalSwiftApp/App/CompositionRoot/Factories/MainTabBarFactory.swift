//
//  MainTabBarFactory.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

protocol MainTabBarFactory {
    func makeMainTabBar() -> UITabBarController
    func makeProfileCoordinator() -> Coordinator
}

struct MainTabBarFactoryImpl: MainTabBarFactory {
    
    func makeMainTabBar() -> UITabBarController {
        let mainTabBar = MainTabBarController()
        mainTabBar.title = "Основы Swift"
//        mainTabBar.viewControllers = []
        return mainTabBar
    }
    
    func makeProfileCoordinator() -> Coordinator {
        let factory = ProfileFactoryImpl()
        let navigation = UINavigationController()
        let coordinator = ProfileCoordinator(navigation: navigation, factory: factory)
        return coordinator
    }
}
