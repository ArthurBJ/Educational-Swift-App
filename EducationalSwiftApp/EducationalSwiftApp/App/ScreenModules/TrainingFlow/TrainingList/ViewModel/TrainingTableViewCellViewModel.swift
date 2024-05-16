//
//  TrainingTableViewCellViewModel.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 16.05.2024.
//

import Foundation
import Kingfisher

struct TrainingListTableViewCellViewModel {
    
    private(set) var trainingList: TrainingList
    private let kingfisherManager = KingfisherManager.shared
    
    var titleTraining: String {
        return trainingList.titleTraining
    }
    
    var typeOfTraining: String {
        return trainingList.typeOfTraining
    }
    
    var experience: String {
        return trainingList.experience ?? ""
    }
    
    func getImageData() async throws -> UIImage {
        guard let url = URL(string: trainingList.imageURL ?? "") else { return UIImage() }
        return try await withCheckedThrowingContinuation({ continuation in
            
            kingfisherManager.retrieveImage(with: url, completionHandler: { result in
                switch result {
                case .success(let image):
                    continuation.resume(returning: image.image)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            })
            
        })
    }
}
