//
//  TopicsCollectionViewCell.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 18.05.2024.
//

import UIKit
import SnapKit

final class TopicsCollectionViewCell: UICollectionViewCell {
    
    // MARK: Views
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.cornerRadius = 5.0
        view.layer.shadowRadius = 1
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
     lazy var topicLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout
extension TopicsCollectionViewCell {
    private func setConstraints() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(3)
        }
        
        containerView.addSubview(topicLabel)
        topicLabel.snp.makeConstraints { make in
            make.edges.equalTo(containerView).inset(3)
        }
    }
}

extension TopicsCollectionViewCell: Reusable {}
