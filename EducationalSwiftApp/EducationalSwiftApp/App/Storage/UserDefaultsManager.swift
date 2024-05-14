//
//  UserDefaultsManager.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import Foundation

final class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    private init() {}
    
    static let KEY_ONBOARDING_PASS = "onboarding_passed"
    
    var onboardingPassed: Bool {
        get {
            UserDefaults.standard.bool(forKey: UserDefaultsManager.KEY_ONBOARDING_PASS)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsManager.KEY_ONBOARDING_PASS)
        }
    }
}
