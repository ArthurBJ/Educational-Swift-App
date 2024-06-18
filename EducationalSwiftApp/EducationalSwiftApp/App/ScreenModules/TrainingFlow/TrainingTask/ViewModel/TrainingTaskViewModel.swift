//
//  TrainingTaskViewModel.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 17.06.2024.
//

import Foundation
import Combine

final class TrainingTaskViewModel {
    
    private let networkManager: NetworkManager
    var state: PassthroughSubject<StateController, Never>
    private var theories: [Theory] = []
    private var practices: [Practice] = []
    var theoryCount: Int = 0
    var practiceCount: Int = 0
    
    var theoriesCount: Int {
        return theories.count
    }
    
    var practicesCount: Int {
        return practices.count
    }
    
    init(state: PassthroughSubject<StateController, Never>, networkManager: NetworkManager) {
        self.state = state
        self.networkManager = networkManager
    }
    
    func viewDidLoad() {
        fetchTheories()
        fetchPractice()
    }
    
    private func fetchTheories() {
        state.send(.loading)
        Task {
            let result = await networkManager.trainingtasks(id: id, completion: { practices, string in
                await updateUI(result: practices)
            })
        }
    }
    
    private func fetchPractice() {
        state.send(.loading)
        Task {
            let result = await networkManager.trainingtasks(id: id, completion: { practices, string in
                await updateUI(result: practices)
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
    
    func getTaskTheory() -> Theory? {
        if theoryCount < theories.count {
            let theory = theories[theoryCount]
            theoryCount += 1
            return theory
        } else {
            return nil
        }
    }
    
    func getTaskPractice() -> Practice? {
        if practiceCount < practices.count {
            let practice = practices[practiceCount]
            practiceCount += 1
            return practice
        } else {
            return nil
        }
    }
    
}
