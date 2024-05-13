//
//  AppCoordinator.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 13.05.2024.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var navigation: UINavigationController
    private let appFactory: AppFactory
    
    init(navigation: UINavigationController, appFactory: AppFactory, window: UIWindow?) {
        self.navigation = navigation
        self.appFactory = appFactory
        configWindow(window: window)
    }
    
    func start() {
        let cooridnator = appFactory.makeOnboardingCoordinator(navigation: navigation)
        cooridnator.start()
    }
    
    private func configWindow(window: UIWindow?) {
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
    
}
