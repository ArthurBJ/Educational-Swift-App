//
//  OnboardingCoordinator.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 13.05.2024.
//

import UIKit

final class OnboardingCoordinator: Coordinator {
    
    var navigation: UINavigationController
    private let onboardingFactory: OnboardingFactory
    
    init(navigation: UINavigationController, onboardingFactory: OnboardingFactory) {
        self.navigation = navigation
        self.onboardingFactory = onboardingFactory
    }
    
    func start() {
        let controller = onboardingFactory.makeModule()
        navigation.pushViewController(controller, animated: true)
    }
    
    
}
