//
//  EduExperienceLabelView.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 16.05.2024.
//

import UIKit
import SnapKit

final class EduExperienceLabelView: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.layer.borderColor = UIColor.gray.cgColor
        label.textColor = .gray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 10
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.gray.cgColor
        
        addSubview(label)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabelTitle(title: String) {
        label.text = title
    }
    
    private func setConstraints() {
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
