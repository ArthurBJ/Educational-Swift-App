//
//  TrainingTaskCoordinator.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

protocol TrainingTaskCoordinatorDelegate: AnyObject {
    func didFinishTrainingTaskFlow(childCoordinator: Coordinator)
}

final class TrainingTaskCoordinator: Coordinator {
    
    var navigation: Navigation
    private let factory: TrainingTaskFactory
    private weak var delegate: TrainingTaskCoordinatorDelegate?
    
    init(navigation: Navigation, factory: TrainingTaskFactory, delegate: TrainingTaskCoordinatorDelegate) {
        self.navigation = navigation
        self.factory = factory
        self.delegate = delegate
    }
    
    func start() {
        let controller = factory.makeTrainingTaskViewController(coordinator: self)
        navigation.viewControllers = [controller]
    }
    
}

extension TrainingTaskCoordinator: TrainingTaskViewControllerCoordinator {
    
    func didTapCancelTaskButton() {
        delegate?.didFinishTrainingTaskFlow(childCoordinator: self)
    }
    
    func didTapFinishTaskButton() {
        print("hfjskd")
        let trainingDoneCoordinator = factory.makeTrainingDoneCoordinator(delegate: self, navigation: navigation)
        navigation.pushViewController(TrainingDoneViewController(coordinator: self), animated: true)
//        addChildCoordinatorStart(trainingDoneCoordinator)
//        navigation.present(trainingDoneCoordinator.navigation.rootViewController, animated: true)
//        trainingDoneCoordinator.navigation.dismissNavigation = { [weak self] in
//            self?.removeChildCoordinator(trainingDoneCoordinator)
//        }
    }
    
//    func didTapFinishTaskButton() {
//        let trainingDoneCoordinator = factory.makeTrainingDoneCoordinator(delegate: self, navigation: navigation)
//        navigation.pushViewController(TrainingDoneViewController(coordinator: <#T##TrainingDoneViewControllerCoordinator#>), animated: <#T##Bool#>)
    
//        print("dakjdhkjsa")
//    }
    
}

extension TrainingTaskCoordinator: TrainingDoneViewControllerCoordinator {
    func didTapDoneButton() {
        
    }
    

}

extension TrainingTaskCoordinator: TrainingDoneCoordinatorDelegate {
    func didFinishTrainingTaskFlow(childCoordinator: Coordinator) {
        print("12314123")
    }
    
}
