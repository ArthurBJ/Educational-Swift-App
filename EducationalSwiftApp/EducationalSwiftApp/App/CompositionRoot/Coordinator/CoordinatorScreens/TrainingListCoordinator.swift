//
//  TrainingListCoordinator.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

final class TrainingListCoordinator: Coordinator {
    
    var navigation: Navigation
    private let factory: TrainingListFactory
    var childCoordinators: [Coordinator] = []
    
    init(navigation: Navigation, factory: TrainingListFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeTrainingListViewController(coordinator: self)
        navigation.rootViewController.setupNavBarColor()
        factory.makeItemTabBar(navigation: navigation)
        navigation.pushViewController(controller, animated: true)
    }
    
}

extension TrainingListCoordinator: TrainingListViewControllerCoordinator {
    func didSelectTaskCell(id: Int) {
        let trainingTaskCoordinator = factory.makeTrainingTaskCoordinator(delegate: self)
        addChildCoordinatorStart(trainingTaskCoordinator)
        navigation.present(trainingTaskCoordinator.navigation.rootViewController, animated: true)
        trainingTaskCoordinator.navigation.dismissNavigation = { [weak self] in
            self?.removeChildCoordinator(trainingTaskCoordinator)
        }
    }
    
}


// MARK: - TrainingTaskCoordinatorDelegate
extension TrainingListCoordinator: TrainingTaskCoordinatorDelegate {
    func didFinishTrainingTaskFlow(childCoordinator: Coordinator) {
        childCoordinator.navigation.dismissNavigation = nil
        removeChildCoordinator(childCoordinator)
        navigation.dismiss(animated: true)
    }
    
}


// MARK: - ParentCoordinator
extension TrainingListCoordinator: ParentCoordinator { }
