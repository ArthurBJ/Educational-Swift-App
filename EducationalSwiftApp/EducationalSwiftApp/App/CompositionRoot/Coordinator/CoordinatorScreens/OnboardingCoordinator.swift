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
    
    var navigation: Navigation
    private let onboardingFactory: OnboardingFactory
    weak var delegate: OnboardingCoordinatorDelegate?
    
    init(navigation: Navigation, onboardingFactory: OnboardingFactory, delegate: OnboardingCoordinatorDelegate) {
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
        delegate?.didFinishOnboarding()
    }
    
}
