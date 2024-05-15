//
//  TrainingTableViewCell.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 16.05.2024.
//

import UIKit

final class TrainingListTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TrainingListTableViewCell: Reusable {}
