//
//  AppFactory.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 13.05.2024.
//

import UIKit

protocol AppFactory {
    func makeOnboardingCoordinator(navigation: Navigation, delegate: OnboardingCoordinatorDelegate) -> Coordinator
    func makeMainTabBarCoordinator(navigation: Navigation) -> Coordinator
}

struct AppFactoryImpl: AppFactory {
    
    func makeOnboardingCoordinator(navigation: Navigation, delegate: OnboardingCoordinatorDelegate) -> Coordinator {
        let onboardingFactory = OnboardingFactoryImpl()
        let onboardingCoordinator = OnboardingCoordinator(navigation: navigation, onboardingFactory: onboardingFactory, delegate: delegate)
        return onboardingCoordinator
    }
    
    func makeMainTabBarCoordinator(navigation: Navigation) -> Coordinator {
        let mainTabBarFactory = MainTabBarFactoryImpl()
        let mainTabBarCoordinator = MainTabBarCoordinator(navigation: navigation, factory: mainTabBarFactory)
        return mainTabBarCoordinator
    }
    
    
}
