//
//  UIPageViewController + Extension.swift
//  EducationalSwiftApp
//
//  Created by Артур Байбиков on 17.06.2024.
//

import UIKit

extension UIPageViewController {
     var isPagingEnabled: Bool {
        get {
           var isEnabled: Bool = true
           for view in view.subviews {
               if let subView = view as? UIScrollView {
                   isEnabled = subView.isScrollEnabled
               }
           }
           return isEnabled
       }
       set {
           for view in view.subviews {
               if let subView = view as? UIScrollView {
                   subView.isScrollEnabled = newValue
               }
           }
       }
   }
}
