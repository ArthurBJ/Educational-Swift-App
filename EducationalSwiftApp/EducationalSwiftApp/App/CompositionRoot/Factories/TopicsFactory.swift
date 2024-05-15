//
//  TopicsFactory.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

protocol TopicsFactory {
    func makeTopicsController() -> UIViewController
    func makeItemTabBar(navigation: UINavigationController)
}

struct TopicsFactoryImpl: TopicsFactory, ItemTabBarFactory {
    
    func makeTopicsController() -> UIViewController {
        let controller = TopicsViewController()
        controller.title = "Темы"
        return controller
    }
    
    func makeItemTabBar(navigation: UINavigationController) {
        makeItemTabBar(navigation: navigation, title: "Темы", image: "book", selectedImage: "book.fill")
    }
}
