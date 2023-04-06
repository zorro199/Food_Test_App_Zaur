//
//  UIView + Extension.swift
//  Food_Test_App
//
//  Created by Zaur on 04.04.2023.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
    
}
