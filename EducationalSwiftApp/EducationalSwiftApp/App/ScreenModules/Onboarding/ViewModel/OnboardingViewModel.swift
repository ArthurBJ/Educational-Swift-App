//
//  OnboardingViewModel.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import Foundation
import Combine

protocol OnboardingViewModel {
    var state: PassthroughSubject<StateController, Never> { get }
    var menuItemsCount: Int { get }
    func viewDidLoad()
    func getOnboardingItem(indexPath: IndexPath) -> Onboarding
}

final class OnboardingViewModelImpl: OnboardingViewModel {
    
    private let networkManager: NetworkManager
    var state: PassthroughSubject<StateController, Never>
    
    var onboardingItemsCount: Int {
        return onboardingItems.count
    }
    
    private var onboardingItems: [Onboarding] = []
    
    init(state: PassthroughSubject<StateController, Never>) {
        self.state = state
    }
    
    func viewDidLoad() {
        state.send(.loading)
        Task {
            let result = await networkManager.getOnboarding(completion: { success, error in
                await updateUI(result: success)
            })
        }
    }
    
    @MainActor private func updateUI(result: Result<[Onboarding], Error>) {
        switch result {
        case .success(let menuItems):
            self.menuItems = menuItems
            state.send(.success)
        case .failure(let error):
            state.send(.fail(error: error.localizedDescription))
        }
    }
    
    func getOnboardingItem(indexPath: IndexPath) -> Onboarding {
        return onboardingItems[indexPath.row]
    }
    
    func onboardingFinish() {
        UserDefaultsManager.shared.onboardingPassed = true
    }
    
}
