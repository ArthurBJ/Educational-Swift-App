//
//  TrainingListViewModel.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 16.05.2024.
//

import Foundation

final class TrainingListViewModel {
    
    private var trainingLists: [TrainingList] = []
    
    var trainingListCount: Int {
        return trainingLists.count
    }
    
    func trainingListViewModel(row: Int) -> TrainingListTableViewCellViewModel {
        let trainingList = trainingLists[row]
        
        return TrainingListTableViewCellViewModel(trainingList: trainingList)
    }
}
