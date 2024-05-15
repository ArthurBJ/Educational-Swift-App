//
//  AppCoordinator.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 13.05.2024.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var navigation: Navigation
    private let appFactory: AppFactory
    var childCoordinators: [Coordinator] = []
    
    init(navigation: Navigation, appFactory: AppFactory, window: UIWindow?) {
        self.navigation = navigation
        self.appFactory = appFactory
        configWindow(window: window)
    }
    
    func start() {
        startSomeCoordinator()
    }
    
    private func startSomeCoordinator() {
        UserDefaultsManager.shared.onboardingPassed ? startMainTabBarCoordinator() : startOnboardingCoordinator()
    }
    
    private func startOnboardingCoordinator() {
        let onboardingCoordinator = appFactory.makeOnboardingCoordinator(navigation: navigation, delegate: self)
        addChildCoordinatorStart(onboardingCoordinator)
    }
    
    private func startMainTabBarCoordinator() {
        let mainTabBarCoordinator = appFactory.makeMainTabBarCoordinator(navigation: navigation)
        addChildCoordinatorStart(mainTabBarCoordinator)
    }
    
    private func configWindow(window: UIWindow?) {
        window?.rootViewController = navigation.rootViewController
        window?.makeKeyAndVisible()
    }
    
    private func cleanCoordinatorsAndStart() {
        navigation.viewControllers = []
        clearAllChildCoordinator()
        startSomeCoordinator()
    }
}


// MARK: - OnboardingCoordinatorDelegate
extension AppCoordinator: OnboardingCoordinatorDelegate {
    func didFinishOnboarding() {
        cleanCoordinatorsAndStart()
    }
    
}


// MARK: - ParentCoordinator
extension AppCoordinator: ParentCoordinator { }
