//
//  BaseViewModel.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 19.06.2024.
//

import Foundation
import Combine

protocol BaseViewModel {
    var state: PassthroughSubject<StateController, Never> { get }
    func viewDidLoad()
}
