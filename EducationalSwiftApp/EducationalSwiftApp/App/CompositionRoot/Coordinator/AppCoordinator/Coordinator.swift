//
//  Coordinator.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 13.05.2024.
//

import UIKit

protocol Coordinator {
    var navigation: Navigation { get set }
    func start()
}
