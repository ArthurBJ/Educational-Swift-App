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
    private lazy var mainContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
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
        label.text = "Урок"
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.textColor = .gray
        return label
    }()
    
    private lazy var titleTrainingLabel: UILabel = {
        let label = UILabel()
        label.text = "Начало работы с Swift"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13, weight: .bold)
        return label
    }()
    
    private lazy var blankView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private lazy var experienceView = EduExperienceLabelView()
    
    private lazy var goToStudyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Учиться", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(hexString: "#1565C0").withAlphaComponent(194/255)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    
    // MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(hexString: "#EDEDF4")
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
        experienceView.setLabelTitle(title: trainingListViewModel.experience)
        trainingImageView.image = UIImage(systemName: "bolt.slash.fill")
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
        contentView.addSubview(mainContainerView)
        mainContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        let VstackView = UIStackView(arrangedSubviews: [typeOfTrainingLabel, titleTrainingLabel, blankView], axis: .vertical, spacing: 10)
        VstackView.alignment = .top
        VstackView.distribution = .fillEqually
        
        let HstackView = UIStackView(arrangedSubviews: [trainingImageView, VstackView], axis: .horizontal, spacing: 20)
        HstackView.alignment = .center
        
        trainingImageView.snp.makeConstraints { make in
            make.size.equalTo(30)
        }
        
        blankView.addSubview(experienceView)
        experienceView.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(50)
        }
        
        mainContainerView.addSubview(HstackView)
        HstackView.snp.makeConstraints { make in
            make.leading.equalTo(mainContainerView.snp_leadingMargin).offset(15)
            make.width.equalTo(mainContainerView.snp_width).multipliedBy(0.8)
            make.top.equalTo(mainContainerView).offset(10)
            make.height.equalTo(mainContainerView).multipliedBy(0.5)
        }
        
        mainContainerView.addSubview(goToStudyButton)
        goToStudyButton.snp.makeConstraints { make in
            make.leading.equalTo(mainContainerView).offset(5)
            make.trailing.equalTo(mainContainerView).offset(-5)
            make.top.equalTo(HstackView.snp.bottom).offset(15)
            make.bottom.equalTo(mainContainerView.snp_bottomMargin).offset(-5)
        }
    }
}

extension TrainingListTableViewCell: Reusable {}
