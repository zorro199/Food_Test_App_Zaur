//
//  R.swift
//  Food_Test_App
//
//  Created by Zaur on 03.04.2023.
//

import UIKit

enum R {
    enum Colors {
        static let active = UIColor(hexString: "#FD3A69")
        static let inactive = UIColor(hexString: "#C3C4C9")
        static let cityColor = UIColor(hexString: "#222831")
        static let barColor = UIColor(hexString: "#F3F5F9")
        static let isSelect = UIColor(hexString: "#ffd8e1")
        static let isLabelSelect = UIColor(hexString: "#FD3A69")
        static let isLabelDeSelect = UIColor(hexString: "#fe9db4")
        static let descriptionLabel = UIColor(hexString: "#AAAAAD")
        static let borderPriceLabel = UIColor(hexString: "#FD3A69")
    }
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .menu:
                    return "Меню"
                case .contacts:
                    return "Контакты"
                case .profile:
                    return "Профиль"
                case .bag:
                    return "Корзина"
                }
            }
        }
        enum Comon {
            static let cityButton = "Москва"
        }
    }
    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .menu:
                    return UIImage(named: "menu") ?? UIImage()
                case .contacts:
                    return UIImage(named: "map") ?? UIImage()
                case .profile:
                    return UIImage(named: "union") ?? UIImage()
                case .bag:
                    return UIImage(named: "bag") ?? UIImage()
                }
            }
        }
        enum Comon {
            static let downArrow = UIImage(named: "icon") ?? UIImage()
            static let banner = UIImage(named: "banner") ?? UIImage()
            static let sadSmile = UIImage(named: "smileSad") ?? UIImage()
        }
    }
}
