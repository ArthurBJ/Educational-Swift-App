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
