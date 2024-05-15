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
//    func makeProfileCoordinator() -> Coordinator
//    func makeTopicsCoordinator() -> Coordinator
}

struct MainTabBarFactoryImpl: MainTabBarFactory {
    
    func makeMainTabBar() -> UITabBarController {
        let mainTabBar = MainTabBarController()
        mainTabBar.title = "Основы Swift"
//        mainTabBar.viewControllers = []
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
        let navigation = UINavigationController()
        let coordinator = ProfileCoordinator(navigation: navigation, factory: factory)
        return coordinator
    }
    
    private func makeTopicsCoordinator() -> Coordinator {
        let factory = TopicsFactoryImpl()
        let navigation = UINavigationController()
        let coordinator = TopicsCoordinator(navigation: navigation, factory: factory)
        return coordinator
    }
    
    private func makeTrainingListCoordinator() -> Coordinator {
        let factory = TrainingListFactoryImpl()
        let navigation = UINavigationController()
        let coordinator = TrainingListCoordinator(navigation: navigation, factory: factory)
        return coordinator
    }
    
}
