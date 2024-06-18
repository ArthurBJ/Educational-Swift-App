//
//  TrainingTaskFactory.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

protocol TrainingTaskFactory {
    func makeTrainingTaskViewController(coordinator: TrainingTaskViewControllerCoordinator) -> UIViewController
    func makeTrainingDoneCoordinator(delegate: TrainingDoneCoordinatorDelegate, navigation: Navigation) -> Coordinator
}

struct TrainingTaskFactoryImpl: TrainingTaskFactory {
    
    func makeTrainingTaskViewController(coordinator: TrainingTaskViewControllerCoordinator) -> UIViewController {
        let viewModel: TrainingTaskViewModel = TrainingTaskViewModel()
        let controller = TrainingTaskViewController(coordinator: coordinator, viewModel: viewModel)
        controller.title = "Задание"
        return controller
    }
    
    func makeTrainingDoneCoordinator(delegate: TrainingDoneCoordinatorDelegate, navigation: Navigation) -> Coordinator {
        let factory = TaskDoneFactoryImpl()
        let coordinator = TrainingDoneCoordinator(navigation: navigation, factory: factory, delegate: delegate)
        return coordinator
    }
    
}
