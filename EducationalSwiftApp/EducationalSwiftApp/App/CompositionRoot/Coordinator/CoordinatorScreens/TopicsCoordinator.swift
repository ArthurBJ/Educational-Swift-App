//
//  TopicsCoordinator.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

final class TopicsCoordinator: Coordinator {
    
    var navigation: Navigation
    private let factory: TopicsFactory
    
    init(navigation: Navigation, factory: TopicsFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeTopicsController()
        navigation.rootViewController.setupNavBarColor()
        factory.makeItemTabBar(navigation: navigation)
        navigation.pushViewController(controller, animated: true)
    }
    
    
}
