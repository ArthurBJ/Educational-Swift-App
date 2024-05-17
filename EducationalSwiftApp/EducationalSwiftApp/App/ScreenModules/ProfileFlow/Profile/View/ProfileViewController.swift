//
//  ProfileViewController.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

protocol ProfileViewControllerCoordinator: AnyObject {
    func didSelectNavigationButton(profileViewNavigation: ProfileViewNavigation)
}

final class ProfileViewController: UIViewController {
    
    // MARK: Properties
    private weak var coordinator: ProfileViewControllerCoordinator?
    
    // MARK: Views
    
    // MARK: Initializers
    init(coordinator: ProfileViewControllerCoordinator) {
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
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(didTapSetting))
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    @objc private func didTapSetting() {
        coordinator?.didSelectNavigationButton(profileViewNavigation: .changeTheme)
    }
}
