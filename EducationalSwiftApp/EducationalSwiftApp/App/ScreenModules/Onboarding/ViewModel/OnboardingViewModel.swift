//
//  OnboardingViewModel.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import Foundation

final class OnboardingViewModel {
    
    init() {
        
    }
    
    func onboardingFinish() {
        UserDefaultsManager.shared.onboardingPassed = true
    }
}
