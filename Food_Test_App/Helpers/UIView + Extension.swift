//
//  UIView + Extension.swift
//  Food_Test_App
//
//  Created by Zaur on 22.06.2023.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
    
}
