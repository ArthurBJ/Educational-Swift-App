//
//  SectionData.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import Foundation

struct SectionData {
    var isOpen: Bool
    var data: [TrainingListDTO]
}

extension SectionData {
    func mapper() -> [TrainingList] {
        let trainingListModel = data.map {
            return TrainingList(imageURL: $0.trainingImage,
                                typeOfTraining: $0.typeOfTraining,
                                titleTraining: $0.titleTraining,
                                experience: $0.experience)
        }
        return trainingListModel
    }
}
