//
//  StrickCollectionViewCell.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 19.05.2024.
//

import UIKit
import SnapKit

final class StrickCollectionViewCell: UICollectionViewCell {
    
    // MARK: Views
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var roundedView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#EDEDF4")
        return view
    }()
    
    private lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.text = "Вс"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setConstraints()
        
        contentView.layoutIfNeeded()
        roundedView.layer.cornerRadius = roundedView.frame.width / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - Layout
extension StrickCollectionViewCell {
    private func setConstraints() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        containerView.addSubview(roundedView)
        roundedView.snp.makeConstraints { make in
            make.centerX.equalTo(containerView.snp_centerXWithinMargins)
            make.height.width.equalToSuperview().multipliedBy(0.95)
        }
        
        containerView.addSubview(dayLabel)
        dayLabel.snp.makeConstraints { make in
            make.top.equalTo(roundedView.snp_bottomMargin).offset(10)
            make.centerX.equalTo(roundedView.snp_centerXWithinMargins)
        }
    }
}

extension StrickCollectionViewCell: Reusable {}
