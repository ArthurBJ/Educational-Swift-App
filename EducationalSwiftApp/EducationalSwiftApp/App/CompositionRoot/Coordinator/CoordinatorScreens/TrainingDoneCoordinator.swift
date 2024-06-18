//
//  TrainingDoneCoordinator.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 17.06.2024.
//

import UIKit

protocol TrainingDoneCoordinatorDelegate: AnyObject {
    func didFinishTrainingTaskFlow(childCoordinator: Coordinator)
}

final class TrainingDoneCoordinator: Coordinator {
    
    var navigation: Navigation
    private let factory: TaskDoneFactory
    private weak var delegate: TrainingDoneCoordinatorDelegate?
    
    init(navigation: Navigation, factory: TaskDoneFactory, delegate: TrainingDoneCoordinatorDelegate) {
        self.navigation = navigation
        self.factory = factory
        self.delegate = delegate
    }
    
    func start() {
        let controller = factory.makeTrainingDoneViewController(coordinator: self)
        navigation.viewControllers = [controller]
    }
    
}


extension TrainingDoneCoordinator: TrainingDoneViewControllerCoordinator {
    func didTapDoneButton() {
        
    }
    
}
