//
//  EduTrainingListSectionHeader.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 17.05.2024.
//

import UIKit
import SnapKit

final class EduTrainingListSectionHeader: UIButton {
    
    var isSectionHidden: Bool = false {
        didSet {
            if isSectionHidden {
                hiddenArrowImage.image = UIImage(systemName: "chevron.down")
            } else {
                hiddenArrowImage.image = UIImage(systemName: "chevron.up")
            }
        }
    }
    
    var isSectionClosed: Bool = false {
        didSet {
            if isSectionClosed {
                openClosedImage.image = UIImage(systemName: "lock")
            } else {
                openClosedImage.image = UIImage(systemName: "play.square")
            }
        }
    }
    
    private let openClosedImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "play.square") //lock
        imageView.tintColor = UIColor(hexString: "#149EF2")
        return imageView
    }()
    
    private let hiddenArrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.down") //chevron.up
        imageView.tintColor = .black
        return imageView
    }()
    
    private let themeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Основные понятия"
        label.font = .systemFont(ofSize: 19, weight: .bold)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(theme: String) {
        themeTitleLabel.text = theme
    }
    
    private func setConstraints() {
        self.addSubview(openClosedImage)
        openClosedImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.size.equalTo(30)
        }
        
        self.addSubview(themeTitleLabel)
        themeTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(openClosedImage).offset(45)
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
        }
        
        self.addSubview(hiddenArrowImage)
        hiddenArrowImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
            make.size.equalTo(20)
        }
    }
}
