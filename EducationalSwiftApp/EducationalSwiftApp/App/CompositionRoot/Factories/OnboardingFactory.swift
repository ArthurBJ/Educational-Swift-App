//
//  OnboardingFactory.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 13.05.2024.
//

import UIKit

protocol OnboardingFactory {
    func makeModule(coordinator: OnboardingViewControllerCoordinator) -> UIViewController
}

struct OnboardingFactoryImpl: OnboardingFactory {
    
    func makeModule(coordinator: OnboardingViewControllerCoordinator) -> UIViewController {
        let viewModel = OnboardingViewModel()
        let pages = self.makeOnboardingScreens()
        let onboardingViewController = OnboardingViewController(pages: pages, coordinator: coordinator, viewModel: viewModel)
        return onboardingViewController
    }
    
    private func makeOnboardingScreens() -> [UIViewController] {
        var pages = [UIViewController]()
        
        let firstVC = OnboardingPartViewController()
        firstVC.configure(question: "Что лучше всего вас описывает?", answer1: "Я студент", answer2: "Я работаю", answer3: "Я предприниматель", answer4: "Другое")
        
        let secondVC = OnboardingPartViewController()
        secondVC.configure(question: "Сколько вам лет?", answer1: "До 18 лет", answer2: "19 - 24", answer3: "25 - 34", answer4: "34 года и старше")
        
        let thirdVC = OnboardingPartViewController()
        thirdVC.configure(question: "Почему вы хотите научиться программировать?", answer1: "Я уже изучаю программирование", answer2: "Хочу работать программистом", answer3: "Как хобби/для личного проекта", answer4: "Другое")
        
        let fourthVC = OnboardingPartViewController()
        fourthVC.configure(question: "Как вы хотите учиться?", answer1: "Интенсивно - 20 мин в день", answer2: "Быстро - 15 мин в день", answer3: "Умеренно - 10 мин в день", answer4: "Неформально - 5 мин в день")
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourthVC)
        
        return pages
    }
    
}
