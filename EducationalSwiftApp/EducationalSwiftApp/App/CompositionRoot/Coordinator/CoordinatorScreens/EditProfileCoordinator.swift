//
//  EditProfileCoordinator.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

final class EditProfileCoordinator: Coordinator {
    
    var navigation: Navigation
    private let factory: EditProfileFactory
    
    init(navigation: Navigation, factory: EditProfileFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        
    }
    
}
