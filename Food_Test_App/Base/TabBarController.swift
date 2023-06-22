//
//  TabBarController.swift
//  Food_Test_App
//
//  Created by Zaur on 03.04.2023.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case menu
    case contacts
    case profile
    case bag
}

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
        switchTo(tab: .menu)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func switchTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }
    
    private func configure() {
        tabBar.tintColor = R.Colors.active
        tabBar.barTintColor = R.Colors.inactive
        tabBar.isTranslucent = false
        UITabBar.appearance().barTintColor = .white
        //set NavigationControllers
        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            let controller = NavBarController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(title: R.Strings.TabBar.title(for: tab),
                                                 image: R.Images.TabBar.icon(for: tab),
                                                 tag: tab.rawValue)
            return controller
        }
        setViewControllers(controllers, animated: false)
    }
    
    private func getController(for tab: Tabs) -> UIViewController {
        switch tab {
        case .menu:
            return FoodBuilder.createFoodModule()
        case .contacts:
            return PizzaViewController()
        case .profile:
            return PizzaViewController()
        case .bag:
            return PizzaViewController()
        }
    }
    
}
