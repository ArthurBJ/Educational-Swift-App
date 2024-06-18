//
//  TaskDoneFactory.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 17.06.2024.
//

import UIKit

protocol TaskDoneFactory {
    func makeTrainingDoneViewController(coordinator: TrainingDoneViewControllerCoordinator) -> UIViewController
}

struct TaskDoneFactoryImpl: TaskDoneFactory {
    
    func makeTrainingDoneViewController(coordinator: TrainingDoneViewControllerCoordinator) -> UIViewController {
//        let viewModel: TrainingTaskViewModel = TrainingTaskDoneViewModel()
        let controller = TrainingDoneViewController(coordinator: coordinator)
//        controller.title = "Задание"
        return controller
    }
    
}
