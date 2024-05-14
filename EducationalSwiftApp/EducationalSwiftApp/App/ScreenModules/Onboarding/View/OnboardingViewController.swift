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
    private var pages = [UIViewController]()
    private var currentPageIndex: Int = 0
    
    
    // MARK: - Views
    private lazy var pageController: UIPageViewController = {
        let controller = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        controller.view.backgroundColor = UIColor(hexString: "#000A23")
        return controller
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.isUserInteractionEnabled = false
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = currentPageIndex
        return pageControl
    }()

    // MARK: - Initializers
    init(pages: [UIViewController] = [UIViewController]() /*coordinator: OnboardingViewControllerCoordinator*/) {
        self.pages = pages
//        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print(pages.count)
        
        configView()
    }

    // MARK: - Private methods
    private func configView() {
        view.backgroundColor = .systemBackground
        
        setupPageViewController()
        setConstraints()
    }

    private func setupPageViewController() {
        pageController.delegate = self
        pageController.dataSource = self
        pageController.setViewControllers([pages.first!], direction: .forward, animated: true)
        addChild(pageController)
        view.addSubview(pageController.view)
        pageController.didMove(toParent: self)
    }
    
    private func setupPageControl() {
        
    }
}


// MARK: - UIPageViewControllerDelegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let index = pages.firstIndex(of: pendingViewControllers.first!) {
            currentPageIndex = index
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            pageControl.currentPage = currentPageIndex
        }
    }
}

// MARK: - UIPageViewControllerDataSource
extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex > 0 else { return nil }

        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex < pages.count - 1 else { return nil }

        return pages[currentIndex + 1]
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
