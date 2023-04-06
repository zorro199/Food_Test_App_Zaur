//
//  FoodBuilder.swift
//  Food_Test_App
//
//  Created by Zaur on 04.04.2023.
//

import UIKit

protocol Builder {
    static func createFoodModule() -> UIViewController
}

class FoodBuilder: Builder {
    static func createFoodModule() -> UIViewController {
        let view = FoodViewController()
        let network = NetworkDataFetcher()
        let presenter = FoodPresenter(view: view, network: network)
        view.presenter = presenter 
        return view
    }
}
