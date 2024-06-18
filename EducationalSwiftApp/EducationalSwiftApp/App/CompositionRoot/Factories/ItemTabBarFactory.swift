//
//  ItemTabBarFactory.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 15.05.2024.
//

import UIKit

protocol ItemTabBarFactory { }

extension ItemTabBarFactory {
    
    func makeItemTabBar(navigation: Navigation,
                        title: String,
                        image: String,
                        selectedImage: String
    ) {
        let tabBarItem = UITabBarItem(title: title,
                                      image: UIImage(systemName: image),
                                      selectedImage: UIImage(systemName: selectedImage))
        
        navigation.rootViewController.tabBarItem = tabBarItem
    }
}
