//
//  TrainingListFactory.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

protocol TrainingListFactory {
    func makeTrainingListViewController(coordinator: TrainingListViewControllerCoordinator) -> UIViewController
    func makeItemTabBar(navigation: Navigation)
    func makeTrainingTaskCoordinator(delegate: TrainingTaskCoordinatorDelegate) -> Coordinator
}

struct TrainingListFactoryImpl: TrainingListFactory, ItemTabBarFactory {
    
    func makeTrainingListViewController(coordinator: TrainingListViewControllerCoordinator) -> UIViewController {
        let controller = TrainingListViewController(coordinator: coordinator)
        controller.title = "Обучение"
        return controller
    }
    
    func makeItemTabBar(navigation: Navigation) {
        makeItemTabBar(navigation: navigation, title: "Обучение", image: "graduationcap", selectedImage: "graduationcap.fill")
    }
    
    func makeTrainingTaskCoordinator(delegate: TrainingTaskCoordinatorDelegate) -> Coordinator {
        let factory = TrainingTaskFactoryImpl()
        let navigationController = UINavigationController()
        navigationController.modalPresentationStyle = .fullScreen
        let navigation = NavigationImpl(rootViewController: navigationController)
        let coordinator = TrainingTaskCoordinator(navigation: navigation, factory: factory, delegate: delegate)
        return coordinator
    }
    
}
