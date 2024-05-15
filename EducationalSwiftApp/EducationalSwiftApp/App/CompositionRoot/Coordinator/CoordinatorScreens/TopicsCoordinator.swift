//
//  TopicsCoordinator.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

final class TopicsCoordinator: Coordinator {
    
    var navigation: UINavigationController
    private let factory: TopicsFactory
    
    init(navigation: UINavigationController, factory: TopicsFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeTopicsController()
        factory.makeItemTabBar(navigation: navigation)
        navigation.pushViewController(controller, animated: true)
    }
    
    
}
