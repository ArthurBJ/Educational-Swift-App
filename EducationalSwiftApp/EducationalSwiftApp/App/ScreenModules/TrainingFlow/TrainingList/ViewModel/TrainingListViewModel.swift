//
//  TrainingListViewModel.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 16.05.2024.
//

import Foundation
import Combine

protocol TrainingListViewModel: BaseViewModel {
    var trainingListCount: Int { get }
    var lastPage: Bool { get }
    func getItemMenuViewModel(row: Int) -> TrainingListTableViewCellViewModel
    func getUrlDetail(row: Int) -> String
}

final class TrainingListViewModelImpl: TrainingListViewModel {
    
    var state: PassthroughSubject<StateController, Never>
    
    var trainingListCount: Int {
        return trainingLists.count
    }
    
    var lastPage: Bool {
        lastPageValidationUseCase.lastPage
    }
    
    private var trainingLists: [TrainingList] = []
    private let networkManager: NetworkManager
    
    init(loadCharacterUseCase: LoadCharactersUseCase, state: PassthroughSubject<StateController, Never>, networkManager: NetworkManager) {
        self.state = state
        self.networkManager = networkManager
    }
    
    func viewDidLoad() {
        state.send(.loading)
        Task {
            loadTrainingSection()
        }
    }
    
    private func loadTrainingSection() {
        let resultUseCase = networkManager.trainingSection { success, error in
            updateStateUI(resultUseCase: success)
        }
    }
    
    private func updateStateUI(resultUseCase: Result<[SectionData], Error>) {
        switch resultUseCase {
        case .success(let characters):
            self.trainingLists.append(contentsOf: characters)
            state.send(.success)
        case .failure(let error):
            state.send(.fail(error: error.localizedDescription))
        }
    }
    
    func getItemMenuViewModel(row: Int) -> TrainingListTableViewCellViewModel {
        
        return trainingLists[row]
    }
    
    func getIdList(row: Int) -> Int {
        let trainingList = trainingLists[row]
        return trainingList.id
    }
    
}
