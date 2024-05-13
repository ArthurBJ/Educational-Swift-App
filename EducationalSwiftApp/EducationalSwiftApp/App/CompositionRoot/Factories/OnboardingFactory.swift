//
//  OnboardingFactory.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 13.05.2024.
//

import UIKit

protocol OnboardingFactory {
    func makeModule() -> UIViewController
}

struct OnboardingFactoryImpl: OnboardingFactory {
    
    func makeModule() -> UIViewController {
        let onboardingViewController = OnboardingViewController()
        onboardingViewController.title = "Onboarding"
        return onboardingViewController
    }
    
}
