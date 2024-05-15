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
    
    // MARK: Properties
    private var coordinator: OnboardingViewControllerCoordinator
    private let viewModel: OnboardingViewModel
    private var pages = [UIViewController]()
    private var currentPageIndex: Int = 0
    
    
    // MARK: Views
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

    // MARK: Initializers
    init(pages: [UIViewController] = [UIViewController](),
         coordinator: OnboardingViewControllerCoordinator,
         viewModel: OnboardingViewModel) {
        self.pages = pages
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        setupStartOnboardingPartDelegate()
    }

    // MARK: Private methods
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
    
    private func setupStartOnboardingPartDelegate() {
        switch currentPageIndex {
        case 0:
            (pages[0] as? OnboardingPartViewController)?.delegate = self
        default:
            print("default")
        }
    }
}


// MARK: - OnboardingPartViewControllerDelegate
extension OnboardingViewController: OnboardingPartViewControllerDelegate {
    func didTapAnswerButton() {
        switch pageControl.currentPage {
        case 0:
            currentPageIndex = 1
            pageControl.currentPage = 1
            (pages[currentPageIndex] as? OnboardingPartViewController)?.delegate = self
            pageController.setViewControllers([pages[1]], direction: .forward, animated: true)
        case 1:
            currentPageIndex = 2
            pageControl.currentPage = 2
            (pages[currentPageIndex] as? OnboardingPartViewController)?.delegate = self
            pageController.setViewControllers([pages[2]], direction: .forward, animated: true)
        case 2:
            currentPageIndex = 3
            pageControl.currentPage = 3
            (pages[currentPageIndex] as? OnboardingPartViewController)?.delegate = self
            pageController.setViewControllers([pages[3]], direction: .forward, animated: true)
        case 3:
            viewModel.onboardingFinish()
            coordinator.didTapFinishOnboardingButton()
        default:
            break
        }
    }
    
}


// MARK: - UIPageViewControllerDelegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let index = pages.firstIndex(of: pendingViewControllers.first!) {
            currentPageIndex = index
            (pages[index] as? OnboardingPartViewController)?.delegate = self
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
