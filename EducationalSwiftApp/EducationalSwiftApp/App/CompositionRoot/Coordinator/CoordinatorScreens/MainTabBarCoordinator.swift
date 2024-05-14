//
//  MainTabBarCoordinator.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

final class MainTabBarCoordinator: Coordinator {
    
    var navigation: UINavigationController
    private let factory: MainTabBarFactory
    
    init(navigation: UINavigationController, factory: MainTabBarFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        let navigationTabBar = factory.makeMainTabBar()
        navigation.pushViewController(navigationTabBar, animated: false)
    }
    
    
}
