//
//  OnboardingCoordinator.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 13.05.2024.
//

import UIKit

protocol OnboardingCoordinatorDelegate: AnyObject {
    func didFinishOnboarding()
}

final class OnboardingCoordinator: Coordinator {
    
    var navigation: UINavigationController
    private let onboardingFactory: OnboardingFactory
    weak var delegate: OnboardingCoordinatorDelegate?
    
    init(navigation: UINavigationController, onboardingFactory: OnboardingFactory, delegate: OnboardingCoordinatorDelegate) {
        self.navigation = navigation
        self.onboardingFactory = onboardingFactory
        self.delegate = delegate
    }
    
    func start() {
        let controller = onboardingFactory.makeModule(coordinator: self)
        navigation.pushViewController(controller, animated: true)
    }
    
}

extension OnboardingCoordinator: OnboardingViewControllerCoordinator {
    func didTapFinishOnboardingButton() {
        print("Go to tab bar screen")
        delegate?.didFinishOnboarding()
    }
    
}
