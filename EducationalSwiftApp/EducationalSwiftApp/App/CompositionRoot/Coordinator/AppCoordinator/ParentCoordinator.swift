//
//  ParentCoordinator.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import Foundation

protocol ParentCoordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
}

extension ParentCoordinator {
    func addChildCoordinatorStart(_ childCoordinator: Coordinator?) {
        guard let childCoordinator = childCoordinator else { return }
        childCoordinators.append(childCoordinator)
        childCoordinator.start()
    }
    
    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter{ $0 !== childCoordinator }
    }
    
    func clearAllChildCoordinator() {
        childCoordinators = []
    }
}
