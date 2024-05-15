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
}

final class TrainingTaskViewController: UIViewController {
    
    // MARK: Properties
    private weak var coordinator: TrainingTaskViewControllerCoordinator?
    
    // MARK: Views
    
    // MARK: Initializers
    init(coordinator: TrainingTaskViewControllerCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    // MARK: Private methods
    private func configView() {
        view.backgroundColor = .blue
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "multiply"), style: .plain, target: self, action: #selector(cancelButtonAction))
    }
    
    @objc private func cancelButtonAction() {
        coordinator?.didTapCancelTaskButton()
    }
}
