//
//  MainTabBarController.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    // MARK: Private methods
    private func configView() {
        view.backgroundColor = .orange
    }
}
