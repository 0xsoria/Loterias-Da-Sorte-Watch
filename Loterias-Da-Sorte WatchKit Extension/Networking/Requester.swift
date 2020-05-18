//
//  Requester.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

final class Requester {
    
    //MARK: - Properties
    
    var configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 20.0
        return config
    }()
    
    var session: URLSession {
        return URLSession(configuration: self.configuration)
    }
    
    //MARK: - Methods
    func myRequest<T>(router: Router, onCompletion: @escaping (Result<T, LotteryNetworkError>) -> Void) where T : Decodable, T : Encodable {
        guard let url = router.url() else {
            onCompletion(.failure(.noResponse))
            return
        }
        
        let dataTask = self.session.dataTask(with: url) { (data, response, error) in
            self.response(completion: onCompletion)(data, response, error)
        }
        dataTask.resume()
    }
    
    private func response<T: Codable>(completion: @escaping (Result<T, LotteryNetworkError>) -> Void) -> ((Data?, URLResponse?, Error?) -> Void) {
        return { data, response, error in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    completion(.failure(.noResponse))
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else {
                        completion(.failure(.noData))
                        return
                    }
                    do {
                        let returnData = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(returnData))
                    } catch {
                        completion(.failure(.invalidJSON))
                    }
                } else {
                    completion(.failure(.responseStatusCode(code: response.statusCode)))
                }
            } else {
                completion(.failure(.taskError(error: error!)))
            }
        }
    }
}
