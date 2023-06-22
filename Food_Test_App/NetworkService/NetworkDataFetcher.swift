//
//  NetworkDataFetcher.swift
//  Food_Test_App
//
//  Created by Zaur on 22.06.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData(completion: @escaping(Result<[FoodModel]?, Error>) -> Void )
}

class NetworkDataFetcher: NetworkServiceProtocol {
    
    var networkService = NetworkService()
    
    func fetchData(completion: @escaping(Result<[FoodModel]?, Error>) -> Void ) {
        networkService.request { data, error in
            if let error = error {
                print("Error request search city: \(error.localizedDescription)")
                completion(.failure(error))
            }
            let decoding = self.decodeJson(type: [FoodModel].self, from: data)
            completion(.success(decoding))
        }
    }
    
    private func decodeJson<T: Decodable>(type: T.Type, from data: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = data else {
            return nil
        }
        do {
            let object = try decoder.decode(type.self, from: data)
            return object
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
    
}

