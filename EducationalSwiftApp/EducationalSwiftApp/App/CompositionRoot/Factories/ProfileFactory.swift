//
//  ProfileFactory.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

protocol ProfileFactory {
    func makeProfileController(coordinator: ProfileViewControllerCoordinator) -> UIViewController
    func makeTabBarItem(navigation: UINavigationController)
}

struct ProfileFactoryImpl: ProfileFactory, ItemTabBarFactory {
    
    func makeProfileController(coordinator: ProfileViewControllerCoordinator) -> UIViewController {
        let controller = ProfileViewController(coordinator: coordinator)
        controller.title = "Profile"
        return controller
    }
    
    func makeTabBarItem(navigation: UINavigationController) {
        makeItemTabBar(navigation: navigation, title: "Profile", image: "person", selectedImage: "person.fill")
    }
}

//extension ProfileFactoryImpl: ItemTabBarFactory {
//
//}
