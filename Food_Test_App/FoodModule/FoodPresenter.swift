//
//  FoodPresenter.swift
//  Food_Test_App
//
//  Created by Zaur on 22.06.2023.
//

import UIKit

protocol FoodViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol FoodPresenterProtocol: AnyObject {
    init(view: FoodViewController, network: NetworkDataFetcher)
    var foodModel: [FoodModel]? { get set }
    func getFoods()
}

class FoodPresenter: FoodPresenterProtocol {
    
    var foodModel: [FoodModel]?
    var networkService = NetworkDataFetcher()
    let view = FoodViewController()
    weak var foodViewProtocol: FoodViewProtocol?
    
    required init(view: FoodViewController, network: NetworkDataFetcher) {
        self.foodViewProtocol = view
        self.networkService = network
        getFoods()
    }
    
    func getFoods() {
        networkService.fetchData { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self.foodModel = model
                    self.foodViewProtocol?.success()
                case .failure(let error):
                    self.foodViewProtocol?.failure(error: error)
                }

            }
        }
    }
}

    



