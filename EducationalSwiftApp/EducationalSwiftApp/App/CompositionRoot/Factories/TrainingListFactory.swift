//
//  TrainingListFactory.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

protocol TrainingListFactory {
    func makeTrainingListViewController(coordinator: TrainingListViewControllerCoordinator) -> UIViewController
    func makeTrainingTaskViewController(coordinator: TrainingTaskViewControllerCoordinator) -> UIViewController
    func makeItemTabBar(navigation: Navigation)
}

struct TrainingListFactoryImpl: TrainingListFactory, ItemTabBarFactory {
    
    func makeTrainingListViewController(coordinator: TrainingListViewControllerCoordinator) -> UIViewController {
        let controller = TrainingListViewController(coordinator: coordinator)
        controller.title = "Обучение"
        return controller
    }
    
    func makeTrainingTaskViewController(coordinator: TrainingTaskViewControllerCoordinator) -> UIViewController {
        let controller = TrainingTaskViewController(coordinator: coordinator)
        controller.title = "Задача"
        return controller
    }
    
    func makeItemTabBar(navigation: Navigation) {
        makeItemTabBar(navigation: navigation, title: "Обучение", image: "graduationcap", selectedImage: "graduationcap.fill")
    }
    
}
