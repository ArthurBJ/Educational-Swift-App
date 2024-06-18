//
//  TrainingDoneViewController.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 17.06.2024.
//

import UIKit
import SnapKit

protocol TrainingDoneViewControllerCoordinator: AnyObject {
    func didTapDoneButton()
}

final class TrainingDoneViewController: UIViewController {
    
    // MARK: - Properties
    private weak var coordinator: TrainingDoneViewControllerCoordinator?
    
    // MARK: - Views
    private lazy var checkmarkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .green
        imageView.image = UIImage(systemName: "checkmark")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var taskCompleteLabel: UILabel = {
        let label = UILabel()
        label.text = "Урок завершен"
        label.font = .systemFont(ofSize: 23, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы только что завершили Переменные. Не забывайте проверять свои знания"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#1565C0").withAlphaComponent(94/255)
        return view
    }()
    
    private lazy var yourAwardLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваша награда:"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var experienceLabel: UILabel = {
        let label = UILabel()
        label.text = "+ 15XP"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Продолжить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(hexString: "#1565C0").withAlphaComponent(194/255)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    
    // MARK: - Initializers
    init(coordinator: TrainingDoneViewControllerCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        checkmarkImageView.layoutIfNeeded()
        checkmarkImageView.layer.cornerRadius = checkmarkImageView.frame.size.height / 2
    }
    
    // MARK: - Private methods
    private func configView() {
        view.backgroundColor = .systemBackground
        
        nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        setConstraints()
    }
    
    @objc private func nextButtonPressed() {
        coordinator?.didTapDoneButton()
    }
    
}


// MARK: - Layout
extension TrainingDoneViewController {
    private func setConstraints() {
        view.addSubview(checkmarkImageView)
        checkmarkImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
//          make.centerY.equalToSuperview()
            make.top.equalToSuperview().offset(150)
            make.width.height.equalTo(view.snp.width).multipliedBy(0.4)
        }
        
        view.addSubview(taskCompleteLabel)
        taskCompleteLabel.snp.makeConstraints { make in
            make.centerX.equalTo(checkmarkImageView)
            make.top.equalTo(checkmarkImageView.snp_bottomMargin).offset(30)
        }
        
        view.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalTo(checkmarkImageView)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalTo(taskCompleteLabel.snp_bottomMargin).offset(30)
        }
        
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp_leadingMargin).offset(15)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-15)
            make.top.equalTo(descriptionLabel.snp_bottomMargin).offset(30)
            make.height.equalTo(100)
        }
        
        var stackView = UIStackView(arrangedSubviews: [yourAwardLabel, experienceLabel], axis: .vertical, spacing: 15)
        stackView.alignment = .center
        containerView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(15)
        }
        
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-35)
            make.height.equalTo(40)
        }
    }
}
