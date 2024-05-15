//
//  TrainingListDTO.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 16.05.2024.
//

import Foundation

struct TrainingListDTO: Decodable {
    var trainingImage: String?
    var typeOfTraining: String
    var titleTraining: String
    var experience: String?
}

//extension TrainingListDTO {
//    func mapper() -> [TrainingList] {
//        let trainingListModel = resultsDTO.map {
//            return TrainingList(image: $0.trainingImage,
//                                typeOfTraining: $0.typeOfTraining,
//                                titleTraining: $0.titleTraining,
//                                experience: $0.experience)
//        }
//        return trainingListModel
//    }
//}
