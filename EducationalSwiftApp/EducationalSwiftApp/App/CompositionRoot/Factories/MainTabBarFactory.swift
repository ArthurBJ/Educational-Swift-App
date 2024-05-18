//
//  MainTabBarFactory.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

protocol MainTabBarFactory {
    func makeMainTabBar() -> UITabBarController
    func makeChildCoordinators() -> [Coordinator]
}

struct MainTabBarFactoryImpl: MainTabBarFactory {
    
    func makeMainTabBar() -> UITabBarController {
        let mainTabBar = MainTabBarController()
        return mainTabBar
    }
    
    func makeChildCoordinators() -> [Coordinator] {
        let topicsCoordinator = makeTopicsCoordinator()
        let profileCoordinator = makeProfileCoordinator()
        let trainingListCoordinator = makeTrainingListCoordinator()
        return [trainingListCoordinator, topicsCoordinator, profileCoordinator]
    }
    
    private func makeProfileCoordinator() -> Coordinator {
        let factory = ProfileFactoryImpl()
        let navigation = NavigationImpl(rootViewController: UINavigationController())
        let coordinator = ProfileCoordinator(navigation: navigation, factory: factory)
        return coordinator
    }
    
    private func makeTopicsCoordinator() -> Coordinator {
        let factory = TopicsFactoryImpl()
        let navigation = NavigationImpl(rootViewController: UINavigationController())
        let coordinator = TopicsCoordinator(navigation: navigation, factory: factory)
        return coordinator
    }
    
    private func makeTrainingListCoordinator() -> Coordinator {
        let factory = TrainingListFactoryImpl()
        let navigation = NavigationImpl(rootViewController: UINavigationController())
        let coordinator = TrainingListCoordinator(navigation: navigation, factory: factory)
        return coordinator
    }
    
}
