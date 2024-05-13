//
//  AppFactory.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 13.05.2024.
//

import UIKit

protocol AppFactory {
    func makeOnboardingCoordinator(navigation: UINavigationController) -> Coordinator
    func makeMainTabBarCoordinator(navigation: UINavigationController) -> Coordinator
}

struct AppFactoryImpl: AppFactory {
    
    func makeOnboardingCoordinator(navigation: UINavigationController) -> Coordinator {
        let onboardingFactory = OnboardingFactoryImpl()
        let onboardingCoordinator = OnboardingCoordinator(navigation: navigation, onboardingFactory: onboardingFactory)
        return onboardingCoordinator
    }
    
    func makeMainTabBarCoordinator(navigation: UINavigationController) -> Coordinator {
        let onboardingFactory = OnboardingFactoryImpl()
        let onboardingCoordinator = OnboardingCoordinator(navigation: navigation, onboardingFactory: onboardingFactory)
        return onboardingCoordinator
    }
    
    
}
