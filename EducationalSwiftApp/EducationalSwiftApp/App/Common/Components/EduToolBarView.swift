//
//  EduToolBarView.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 17.05.2024.
//

import UIKit
import SnapKit

final class EduToolBarView: UIView {
    
    var countOfExperience: Int = 0 {
        didSet {
            experienceLabel.text = "\(countOfExperience)"
        }
    }
    
    private let shadowContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor(hexString: "#C9C9C9").cgColor
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .purple
        imageView.image = UIImage(systemName: "cube.fill")
        return imageView
    }()
    
    private let experienceLabel: UILabel = {
        let label = UILabel()
        label.text = "45"
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.textColor = .gray
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        self.addSubview(shadowContainer)
        shadowContainer.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        let stackView = UIStackView(arrangedSubviews: [imageView, experienceLabel], axis: .horizontal, spacing: 5)
        shadowContainer.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.center.equalTo(shadowContainer)
        }
    }
}
