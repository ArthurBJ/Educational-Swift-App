//
//  OnboardingPartViewController.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 14.05.2024.
//

import UIKit
import SnapKit

protocol OnboardingPartViewControllerDelegate: AnyObject {
    func didTapAnswerButton()
}

final class OnboardingPartViewController: UIViewController {
    
    // MARK: - Properties
    weak var delegate: OnboardingPartViewControllerDelegate?
    
    // MARK: - Views
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.textColor = .white
        label.text = "Вопрос"
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var answerButton = EduOnboardingButton(title: "Ответ 1")
    private lazy var answer2Button = EduOnboardingButton(title: "Ответ 2")
    private lazy var answer3Button = EduOnboardingButton(title: "Ответ 3")
    private lazy var answer4Button = EduOnboardingButton(title: "Ответ 4")
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#000A23")
        
        setConstraints()
        configButtonsActions()
    }
    
    // MARK: - methods
    func configure(question: String, answer1: String, answer2: String, answer3: String, answer4: String) {
        questionLabel.text = question
        answerButton.setTitle(answer1, for: .normal)
        answer2Button.setTitle(answer2, for: .normal)
        answer3Button.setTitle(answer3, for: .normal)
        answer4Button.setTitle(answer4, for: .normal)
    }
    
    private func configButtonsActions() {
        answerButton.addTarget(self, action: #selector(answerButtonAction), for: .touchUpInside)
        answer2Button.addTarget(self, action: #selector(answerButtonAction), for: .touchUpInside)
        answer3Button.addTarget(self, action: #selector(answerButtonAction), for: .touchUpInside)
        answer4Button.addTarget(self, action: #selector(answerButtonAction), for: .touchUpInside)
    }
    
    @objc private func answerButtonAction() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.delegate?.didTapAnswerButton()
        }
    }
    
}

// MARK: - Layout
extension OnboardingPartViewController {
    private func setConstraints() {
        view.addSubview(questionLabel)
        questionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.width.equalToSuperview()
        }
        
        view.addSubview(answerButton)
        answerButton.snp.makeConstraints { make in
            make.leading.equalTo(questionLabel.snp_leadingMargin).offset(-10)
            make.top.equalTo(questionLabel.snp_bottomMargin).offset(30)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        view.addSubview(answer2Button)
        answer2Button.snp.makeConstraints { make in
            make.leading.equalTo(questionLabel.snp_leadingMargin).offset(-10)
            make.top.equalTo(answerButton.snp_bottomMargin).offset(20)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        view.addSubview(answer3Button)
        answer3Button.snp.makeConstraints { make in
            make.leading.equalTo(questionLabel.snp_leadingMargin).offset(-10)
            make.top.equalTo(answer2Button.snp_bottomMargin).offset(20)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        view.addSubview(answer4Button)
        answer4Button.snp.makeConstraints { make in
            make.leading.equalTo(questionLabel.snp_leadingMargin).offset(-10)
            make.top.equalTo(answer3Button.snp_bottomMargin).offset(20)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
}
