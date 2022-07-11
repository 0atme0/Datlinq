//
//  NetworkManager.swift
//  BeerApp
//
//  Created by atme on 11/07/2022.
//

import Foundation

class NetworkManager {
    func resumeDataTask(withRequest request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(NetworkError.emptyData))
            }
        }
        dataTask.resume()
    }
}
