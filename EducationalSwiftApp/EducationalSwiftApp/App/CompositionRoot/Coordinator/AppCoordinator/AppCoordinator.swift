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
    private var onboardingCoordinator: Coordinator?
    private var mainTabBarCoordinator: Coordinator?
    
    init(navigation: UINavigationController, appFactory: AppFactory, window: UIWindow?) {
        self.navigation = navigation
        self.appFactory = appFactory
        configWindow(window: window)
    }
    
    func start() {
        
        startSomeCoordinator()
    }
    
    private func startSomeCoordinator() {
        // TODO: check in UserDefaults onbaording pass
        if UserDefaultsManager.shared.onboardingPassed {
            startMainTabBarCoordinator()
        } else {
            startOnboardingCoordinator()
        }
    }
    
    private func startOnboardingCoordinator() {
        onboardingCoordinator = appFactory.makeOnboardingCoordinator(navigation: navigation, delegate: self)
        onboardingCoordinator?.start()
    }
    
    private func startMainTabBarCoordinator() {
        mainTabBarCoordinator = appFactory.makeMainTabBarCoordinator(navigation: navigation)
        mainTabBarCoordinator?.start()
    }
    
    private func configWindow(window: UIWindow?) {
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
    
}

extension AppCoordinator: OnboardingCoordinatorDelegate {
    func didFinishOnboarding() {
        navigation.viewControllers = []
        onboardingCoordinator = nil
        startSomeCoordinator()
    }
    
}
