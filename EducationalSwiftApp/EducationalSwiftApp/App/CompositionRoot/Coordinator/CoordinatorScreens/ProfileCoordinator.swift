//
//  ProfileCoordinator.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    
    var navigation: Navigation
    private let factory: ProfileFactory
    
    init(navigation: Navigation, factory: ProfileFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeProfileController(coordinator: self)
        navigation.rootViewController.setupNavBarColor()
        navigation.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(controller, animated: true)
        factory.makeTabBarItem(navigation: navigation)
    }
    
}

extension ProfileCoordinator: ProfileViewControllerCoordinator {
    func didSelectNavigationButton(profileViewNavigation: ProfileViewNavigation) {
        switch profileViewNavigation {
        case .editProfile:
            print("Edit profile")
            navigation.pushViewController(factory.makeEditProfileViewController(), animated: true)
        case .changeTheme:
            print("Change theme")
        }
    }
    
    
}
