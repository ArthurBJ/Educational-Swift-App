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
    private var trainingTaskCoordinator: Coordinator?
    
    init(navigation: Navigation, factory: TrainingListFactory) {
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
        trainingTaskCoordinator = factory.makeTrainingTaskCoordinator(delegate: self)
        trainingTaskCoordinator?.start()
        
        guard let trainingTaskCoordinator = trainingTaskCoordinator else { return }
        navigation.present(trainingTaskCoordinator.navigation.rootViewController, animated: true)
        trainingTaskCoordinator.navigation.dismissNavigation = { [weak self] in
            self?.trainingTaskCoordinator = nil
        }
    }
    
}


// MARK: - TrainingTaskCoordinatorDelegate
extension TrainingListCoordinator: TrainingTaskCoordinatorDelegate {
    func didFinishTrainingTaskFlow() {
        trainingTaskCoordinator = nil
        navigation.dismiss(animated: true)
    }
    
}
