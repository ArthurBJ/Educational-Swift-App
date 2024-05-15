//
//  TrainingTaskFactory.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

protocol TrainingTaskFactory {
    func makeTrainingTaskViewController(coordinator: TrainingTaskViewControllerCoordinator) -> UIViewController
}

struct TrainingTaskFactoryImpl: TrainingTaskFactory {
    
    func makeTrainingTaskViewController(coordinator: TrainingTaskViewControllerCoordinator) -> UIViewController {
        let controller = TrainingTaskViewController(coordinator: coordinator)
        controller.title = "Задание"
        return controller
    }
}
