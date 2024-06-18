//
//  TopicsViewModel.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 19.06.2024.
//

import Foundation
import Combine

protocol TopicsViewModel {
    var state: PassthroughSubject<StateController, Never> { get }
    var menuItemsCount: Int { get }
    func viewDidLoad()
    func getTopicItem(indexPath: IndexPath) -> Topic
}

final class TopicsViewModelImpl: TopicsViewModel {
    
    private let networkManager: NetworkManager
    var state: PassthroughSubject<StateController, Never>
    
    var topicsItemsCount: Int {
        return topicsItems.count
    }
    
    private var topicsItems: [Topic] = []
    
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
    
    @MainActor private func updateUI(result: Result<[Topic], Error>) {
        switch result {
        case .success(let menuItems):
            self.menuItems = menuItems
            state.send(.success)
        case .failure(let error):
            state.send(.fail(error: error.localizedDescription))
        }
    }
    
    func getTopicItem(indexPath: IndexPath) -> Topic {
        return onboardingItems[indexPath.row]
    }
    
}

