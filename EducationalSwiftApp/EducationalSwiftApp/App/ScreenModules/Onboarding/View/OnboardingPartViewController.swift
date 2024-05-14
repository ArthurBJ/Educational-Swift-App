//
//  OnboardingPartViewController.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 14.05.2024.
//

import UIKit
import SnapKit

final class OnboardingPartViewController: UIViewController {
    
    // MARK: - Views
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.textColor = .white
        label.text = "Что лучше всего вас описывает"
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var answerButton = EduOnboardingButton(title: "Я студент")
    private lazy var answer2Button = EduOnboardingButton(title: "Я работаю")
    private lazy var answer3Button = EduOnboardingButton(title: "Я предприниматель")
    private lazy var answer4Button = EduOnboardingButton(title: "Другое")
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#000A23")
        
        setConstraints()
    }
    
    // MARK: - Private methods
    
}

// MARK: - Layout
extension OnboardingPartViewController {
    private func setConstraints() {
        view.addSubview(questionLabel)
        questionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.width.equalToSuperview().multipliedBy(0.5)
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
