//
//  UINavigationController + Extension.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 17.05.2024.
//

import UIKit

extension UINavigationController {
    
    func setupNavBarColor() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        appearance.backgroundColor = UIColor(hexString: "#1565C0").withAlphaComponent(194/255)
        
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        
        self.navigationBar.tintColor = .white
        UIBarButtonItem.appearance().tintColor = .black
        
    }
}
