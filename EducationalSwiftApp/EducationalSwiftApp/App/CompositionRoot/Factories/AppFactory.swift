//
//  AppFactory.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 13.05.2024.
//

import UIKit

protocol AppFactory {
    func makeOnboardingCoordinator(navigation: UINavigationController, delegate: OnboardingCoordinatorDelegate) -> Coordinator
    func makeMainTabBarCoordinator(navigation: UINavigationController) -> Coordinator
}

struct AppFactoryImpl: AppFactory {
    
    func makeOnboardingCoordinator(navigation: UINavigationController, delegate: OnboardingCoordinatorDelegate) -> Coordinator {
        let onboardingFactory = OnboardingFactoryImpl()
        let onboardingCoordinator = OnboardingCoordinator(navigation: navigation, onboardingFactory: onboardingFactory, delegate: delegate)
        return onboardingCoordinator
    }
    
    func makeMainTabBarCoordinator(navigation: UINavigationController) -> Coordinator {
        let mainTabBarFactory = MainTabBarFactoryImpl()
        let mainTabBarCoordinator = MainTabBarCoordinator(navigation: navigation, factory: mainTabBarFactory)
        return mainTabBarCoordinator
    }
    
    
}
