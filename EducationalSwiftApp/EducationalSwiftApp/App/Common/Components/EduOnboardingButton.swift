//
//  EduOnboardingButton.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 14.05.2024.
//

import UIKit

final class EduOnboardingButton: UIButton {
    
    // MARK: - Properties
    private let touchDownAlpha: Float = 0.3
    private let touchUpAlpha: Float = 1.0
    private let touchDownColor: UIColor = .green
    let animateTime: TimeInterval = 0.4
    
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
        
        self.addTarget(self, action: #selector(buttonTapped), for: .touchDown)
        self.addTarget(self, action: #selector(buttonReleased), for: .touchUpInside)
        self.addTarget(self, action: #selector(buttonReleased), for: .touchUpOutside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Button Actions
    @objc private func buttonTapped() {
        UIView.animate(withDuration: animateTime) {
            self.layer.opacity = self.touchDownAlpha
            self.setTitleColor(self.touchDownColor, for: .highlighted)
            self.layer.borderColor = self.touchDownColor.cgColor
        }
    }
    
    @objc private func buttonReleased() {
        UIView.animate(withDuration: animateTime) {
            self.layer.opacity = self.touchUpAlpha
            self.setTitleColor(.white, for: .normal)
            self.layer.borderColor = UIColor.white.cgColor
        }
    }
}
