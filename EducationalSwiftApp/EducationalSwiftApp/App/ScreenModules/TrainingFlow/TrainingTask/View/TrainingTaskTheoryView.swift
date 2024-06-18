//
//  TrainingTaskTheoryView.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 17.06.2024.
//

import UIKit
import SnapKit

protocol TrainingTaskTheoryViewDelegate: AnyObject {
    func didTapNextButton()
}

final class TrainingTaskTheoryView: UIView {
    
    // MARK: - Properties
    weak var delegate: TrainingTaskTheoryViewDelegate?
    private var progress: Float = 0
    
    var theory: Theory? {
        didSet {
            titleLabel.text = theory?.title
            textLabel.text = theory?.text
        }
    }
    
    // MARK: - Views
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.textColor = .black
        label.text = "Вопрос"
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        label.text = "Текст текст текст текст Текст текст текст текст Текст текст текст текст Текст текст текст текст Текст текст текст текст Текст текст текст текст Текст текст текст текст Текст текст текст текст Текст текст текст текст Текст текст текст текст Текст текст текст текст Текст текст текст текст"
        label.numberOfLines = 0
        return label
    }()
    
    private var progressView: EduProgressView = EduProgressView()
    
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
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setConstraints()
        configButtonsActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    // MARK: - methods
//    func configure(title: String, text: String) {
//        titleLabel.text = title
//        textLabel.text = text
//        nextButton.setTitle("Продолжить", for: .normal)
//    }
    
    func lastTheoryPage() {
        nextButton.setTitle("Завершить", for: .normal)
    }
    
    func makeProgress(currentStep: Int, overallSteps: Int) {
        progress = Float(currentStep) / Float(overallSteps)
        progressView.progress = progress
    }
    
    private func configButtonsActions() {
        nextButton.addTarget(self, action: #selector(answerButtonAction), for: .touchUpInside)
    }
    
    @objc private func answerButtonAction() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.delegate?.didTapNextButton()
        }
    }
    
}


// MARK: - Layout
extension TrainingTaskTheoryView {
    private func setConstraints() {
        addSubview(progressView)
        progressView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(0)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(45)
        }

        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalTo(progressView.snp_bottomMargin).offset(40)
            make.width.equalToSuperview()
        }
        
        addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp_leadingMargin)
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(20)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-35)
            make.height.equalTo(40)
        }
        
    }
}

