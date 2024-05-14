//
//  EduOnboardingButton.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 14.05.2024.
//

import UIKit

final class EduOnboardingButton: UIButton {
    
    // MARK: - Initializers
    init(title: String) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        layer.cornerRadius = 10
        layer.borderWidth = 3
        layer.borderColor = UIColor.white.cgColor
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        setTitleColor(.white, for: .normal)
        contentHorizontalAlignment = .leading
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
