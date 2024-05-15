//
//  TrainingListCoordinator.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

final class TrainingListCoordinator: Coordinator {
    
    var navigation: UINavigationController
    private let factory: TrainingListFactory
    
    init(navigation: UINavigationController, factory: TrainingListFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeTrainingListViewController(coordinator: self)
        factory.makeItemTabBar(navigation: navigation)
        navigation.pushViewController(controller, animated: true)
    }
    
}

extension TrainingListCoordinator: TrainingListViewControllerCoordinator {
    func didSelectTaskCell(id: Int) {
        print("Opened task")
        let controller = factory.makeTrainingTaskViewController(coordinator: self)
        navigation.present(controller, animated: true)
    }
    
}


extension TrainingListCoordinator: TrainingTaskViewControllerCoordinator {
    func didTapCancelTaskButton() {
        print("Cancel task")
    }
    
    func didTapFinishTaskButton() {
        
    }
    
    
}
