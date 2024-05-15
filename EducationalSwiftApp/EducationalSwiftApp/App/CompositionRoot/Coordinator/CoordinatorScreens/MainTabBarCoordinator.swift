//
//  MainTabBarCoordinator.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

final class MainTabBarCoordinator: Coordinator {
    
    var navigation: Navigation
    private let factory: MainTabBarFactory
    var childCoordinators: [Coordinator] = []
    
    init(navigation: Navigation, factory: MainTabBarFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        let navigationTabBar = factory.makeMainTabBar()
        navigation.pushViewController(navigationTabBar, animated: false)
        navigation.navigationBar.isHidden = true
        
        childCoordinators = factory.makeChildCoordinators()
        let childNavigation = childCoordinators.map { $0.navigation.rootViewController }
        childCoordinators.forEach { $0.start() }
        navigationTabBar.viewControllers = childNavigation
    }
    
    
}
