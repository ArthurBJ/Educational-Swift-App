//
//  TrainingTableViewCell.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 16.05.2024.
//

import UIKit
import SnapKit

final class TrainingListTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private var task: Task<Void, Never>?
    
    // MARK: Views
    private lazy var trainingImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var checkMark: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var typeOfTrainingLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var titleTrainingLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var experienceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var goToStudyButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    
    // MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        task?.cancel()
    }
    
    // MARK: Methods
    func configure(trainingListViewModel: TrainingListTableViewCellViewModel) {
        typeOfTrainingLabel.text = trainingListViewModel.typeOfTraining
        titleTrainingLabel.text = trainingListViewModel.titleTraining
        experienceLabel.text = trainingListViewModel.experience
        setImage(trainingListViewModel: trainingListViewModel)
    }
    
    private func setImage(trainingListViewModel: TrainingListTableViewCellViewModel) {
        task = Task {
            do {
                let image = try await trainingListViewModel.getImageData()
                trainingImageView.image = image
            } catch {
                print("Image is not found \(error)")
                trainingImageView.image = UIImage(systemName: "bolt.slash.fill")
            }
        }
    }
    
}


// MARK: - Layout
extension TrainingListTableViewCell {
    private func setConstraints() {
        
    }
}

extension TrainingListTableViewCell: Reusable {}
