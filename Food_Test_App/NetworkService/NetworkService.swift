//
//  NetworkService.swift
//  Food_Test_App
//
//  Created by Zaur on 05.04.2023.
//

import Foundation

class NetworkService {
    
    func request(completion: @escaping (Data?, Error?) -> Void ) {
        let parametrs = self.prepareParametrs()
        let url = self.url(params: parametrs)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = self.createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func url(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = ServiceConstants.baseURL
        components.path = ServiceConstants.path
        return components.url!
    }
    
    private func prepareParametrs() -> [String: String] {
        var parametrs = [String: String]()
        parametrs["page"] = "1"
        return parametrs
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
