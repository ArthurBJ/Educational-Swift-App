//
//  TrainingTaskPracticeViewController.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 17.06.2024.
//

import UIKit
import SnapKit

protocol TrainingTaskPracticeViewDelegate: AnyObject {
    func didTapAnswerButton()
    func didTapContinueButton()
}

final class TrainingTaskPracticeView: UIView {
    
    // MARK: - Properties
    weak var delegate: TrainingTaskPracticeViewDelegate?
    private var progress: Float = 0
    
    var practice: Practice? {
        didSet {
            questionLabel.text = practice?.title
            answerButton.setTitle(practice?.answer1, for: .normal)
            answer2Button.setTitle(practice?.answer2, for: .normal)
            answer3Button.setTitle(practice?.answer3, for: .normal)
            answer4Button.setTitle(practice?.answer4, for: .normal)
            
            clearConstraints()
            
            if let image = practice?.image {
                questionImageView.image = UIImage(named: image)
                setConstraintsWithImage()
            } else {
                questionImageView.image = nil
                setConstraintsWithoutImage()
            }
            
        }
    }
    
    // MARK: - Views
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        label.text = "Текст текст текст текст Текст текст текст"
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var questionImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var answerButton = EduPracticeButton(title: "Ответ 1")
    private lazy var answer2Button = EduPracticeButton(title: "Ответ 2")
    private lazy var answer3Button = EduPracticeButton(title: "Ответ 3")
    private lazy var answer4Button = EduPracticeButton(title: "Ответ 4")
    
    private var progressView: EduProgressView = EduProgressView()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Продолжить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.layer.cornerRadius = 5
        button.backgroundColor = .gray
        button.isEnabled = false
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configButtonsActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


    // MARK: - methods
    func lastPracticePage() {
        nextButton.setTitle("Завершить", for: .normal)
    }
    
    func makeProgress(currentStep: Int, overallSteps: Int) {
        progress = Float(currentStep) / Float(overallSteps)
        progressView.progress = progress
    }
    
    private func configButtonsActions() {
        answerButton.addTarget(self, action: #selector(answerButtonAction), for: .touchUpInside)
        answer2Button.addTarget(self, action: #selector(answerButtonAction), for: .touchUpInside)
        answer3Button.addTarget(self, action: #selector(answerButtonAction), for: .touchUpInside)
        answer4Button.addTarget(self, action: #selector(answerButtonAction), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
    }
    
    @objc private func answerButtonAction() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.nextButton.backgroundColor = UIColor(hexString: "#1565C0").withAlphaComponent(194/255)
            self?.nextButton.isEnabled = true
            self?.delegate?.didTapAnswerButton()
        }
    }
    
    @objc private func nextButtonAction() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.delegate?.didTapContinueButton()
            self?.nextButton.backgroundColor = .gray
            self?.nextButton.isEnabled = false
        }
    }
    
}


// MARK: - Layout
extension TrainingTaskPracticeView {
    private func clearConstraints() {
        progressView.removeFromSuperview()
        questionLabel.removeFromSuperview()
        questionImageView.removeFromSuperview()
        answerButton.removeFromSuperview()
        answer2Button.removeFromSuperview()
        answer3Button.removeFromSuperview()
        answer4Button.removeFromSuperview()
        nextButton.removeFromSuperview()
    }
    
    private func setConstraintsWithImage() {
        addSubview(progressView)
        progressView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(0)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(45)
        }

        addSubview(questionLabel)
        questionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalTo(progressView.snp_bottomMargin).offset(40)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        addSubview(questionImageView)
        questionImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(questionLabel.snp_bottomMargin).offset(10)
            make.height.equalTo(100)
        }
        
        addSubview(answerButton)
        answerButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalTo(questionImageView.snp_bottomMargin).offset(30)
            make.trailing.equalToSuperview().offset(-10)
        }

        addSubview(answer2Button)
        answer2Button.snp.makeConstraints { make in
            make.leading.equalTo(questionLabel.snp_leadingMargin).offset(-10)
            make.top.equalTo(answerButton.snp_bottomMargin).offset(20)
            make.trailing.equalToSuperview().offset(-10)
        }

        addSubview(answer3Button)
        answer3Button.snp.makeConstraints { make in
            make.leading.equalTo(questionLabel.snp_leadingMargin).offset(-10)
            make.top.equalTo(answer2Button.snp_bottomMargin).offset(20)
            make.trailing.equalToSuperview().offset(-10)
        }

        addSubview(answer4Button)
        answer4Button.snp.makeConstraints { make in
            make.leading.equalTo(questionLabel.snp_leadingMargin).offset(-10)
            make.top.equalTo(answer3Button.snp_bottomMargin).offset(20)
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
    
    func setConstraintsWithoutImage() {
        addSubview(progressView)
        progressView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(0)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(45)
        }

        addSubview(questionLabel)
        questionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalTo(progressView.snp_bottomMargin).offset(40)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        addSubview(answerButton)
        answerButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalTo(questionLabel.snp_bottomMargin).offset(30)
            make.trailing.equalToSuperview().offset(-10)
        }

        addSubview(answer2Button)
        answer2Button.snp.makeConstraints { make in
            make.leading.equalTo(questionLabel.snp_leadingMargin).offset(-10)
            make.top.equalTo(answerButton.snp_bottomMargin).offset(20)
            make.trailing.equalToSuperview().offset(-10)
        }

        addSubview(answer3Button)
        answer3Button.snp.makeConstraints { make in
            make.leading.equalTo(questionLabel.snp_leadingMargin).offset(-10)
            make.top.equalTo(answer2Button.snp_bottomMargin).offset(20)
            make.trailing.equalToSuperview().offset(-10)
        }

        addSubview(answer4Button)
        answer4Button.snp.makeConstraints { make in
            make.leading.equalTo(questionLabel.snp_leadingMargin).offset(-10)
            make.top.equalTo(answer3Button.snp_bottomMargin).offset(20)
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
