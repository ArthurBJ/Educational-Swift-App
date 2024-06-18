//
//  TrainingTaskViewController.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

protocol TrainingTaskViewControllerCoordinator: AnyObject {
    func didTapCancelTaskButton()
    func didTapFinishTaskButton()
//    func didTapDoneButton()
}

final class TrainingTaskViewController: UIViewController {
    
    // MARK: Properties
    private weak var coordinator: TrainingTaskViewControllerCoordinator?
    private let viewModel: TrainingTaskViewModel
    private var customTheoryView: TrainingTaskTheoryView = TrainingTaskTheoryView()
    private var customPracticeView: TrainingTaskPracticeView = TrainingTaskPracticeView()
    
    // MARK: Views
    private lazy var progressView: EduProgressView = EduProgressView()
    
    // MARK: Initializers
    init(pages: [UIViewController] = [UIViewController](),
         coordinator: TrainingTaskViewControllerCoordinator,
         viewModel: TrainingTaskViewModel) {
//        self.pages = pages
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycle
    override func loadView() {
        super.loadView()
//        self.view = customTheoryView
        self.view = customPracticeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDidLoad()
        configView()
        customTheoryView.theory = viewModel.getTaskTheory()
        customPracticeView.practice = viewModel.getTaskPractice()
    }
    
    // MARK: Private methods
    private func configView() {
        view.backgroundColor = .systemBackground
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "multiply"), style: .plain, target: self, action: #selector(cancelButtonAction))
        customTheoryView.makeProgress(currentStep: 1, overallSteps: viewModel.theoriesCount)
        customPracticeView.makeProgress(currentStep: 1, overallSteps: viewModel.practicesCount)
        customTheoryView.delegate = self
        customPracticeView.delegate = self
        setConstraints()
    }
    
    @objc private func cancelButtonAction() {
        coordinator?.didTapCancelTaskButton()
    }
}


// MARK: - TrainingTaskTheoryViewDelegate
extension TrainingTaskViewController: TrainingTaskTheoryViewDelegate {
    func didTapNextButton() {
        if viewModel.theoryCount < viewModel.theoriesCount - 1 {
            customTheoryView.theory = viewModel.getTaskTheory()
            customTheoryView.makeProgress(currentStep: viewModel.theoryCount, overallSteps: viewModel.theoriesCount)
        } else if viewModel.theoryCount == viewModel.theoriesCount - 1 {
            customTheoryView.theory = viewModel.getTaskTheory()
            customTheoryView.lastTheoryPage()
            customTheoryView.makeProgress(currentStep: viewModel.theoryCount, overallSteps: viewModel.theoriesCount)
        } else {
            //            coordinator?.didTapFinishTaskButton()
            coordinator?.didTapFinishTaskButton()
        }
    }
}


// MARK: - TrainingTaskPracticeViewDelegate
extension TrainingTaskViewController: TrainingTaskPracticeViewDelegate {
    func didTapAnswerButton() {
        print("fjksdlfjlk")
    }
    
    func didTapContinueButton() {
        if viewModel.practiceCount < viewModel.practicesCount - 1 {
            customPracticeView.practice = viewModel.getTaskPractice()
            customPracticeView.makeProgress(currentStep: viewModel.practiceCount, overallSteps: viewModel.practicesCount)
        } else if viewModel.practiceCount == viewModel.practicesCount - 1 {
            customPracticeView.practice = viewModel.getTaskPractice()
            customPracticeView.lastPracticePage()
            customPracticeView.makeProgress(currentStep: viewModel.practiceCount, overallSteps: viewModel.practicesCount)
        } else {
//            coordinator?.didTapFinishTaskButton()
            coordinator?.didTapFinishTaskButton()
        }
    }
}


// MARK: - Layout
extension TrainingTaskViewController {
    private func setConstraints() {
        
    }
}
