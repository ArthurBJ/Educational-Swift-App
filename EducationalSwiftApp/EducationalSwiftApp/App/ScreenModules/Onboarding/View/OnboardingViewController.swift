//
//  ViewController.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 13.05.2024.
//

import UIKit
import SnapKit

protocol OnboardingViewControllerCoordinator: AnyObject {
    func didTapFinishOnboardingButton()
}

final class OnboardingViewController: UIViewController {
    
    // MARK: - Properties
//    private var coordinator: OnboardingViewControllerCoordinator
    private var pages: [UIViewController] = [OnboardingPartViewController()]
    
    
    // MARK: - Views
    private lazy var pageController: UIPageViewController = {
        let controller = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        return controller
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.isUserInteractionEnabled = false
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        return pageControl
    }()

    // MARK: - Initializers
    init(/*coordinator: OnboardingViewControllerCoordinator*/) {
//        self.coordinator = coordinator
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

    // MARK: - Private methods
    private func configView() {
        view.backgroundColor = .systemBackground
        
        setupPageViewController()
        setConstraints()
    }

    private func setupPageViewController() {
        pageController.setViewControllers([pages.first!], direction: .forward, animated: true)
        addChild(pageController)
        view.addSubview(pageController.view)
        pageController.didMove(toParent: self)
    }
    
    private func setupPageControl() {
        
    }
}

// MARK: - Layout
extension OnboardingViewController {
    private func setConstraints() {
        view.addSubview(pageControl)

        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-45)
        }
        
    }
}
