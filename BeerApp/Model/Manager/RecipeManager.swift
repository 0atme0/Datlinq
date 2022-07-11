//
//  RecipeManager.swift
//  BeerApp
//
//  Created by atme on 11/07/2022.
//

import Foundation

typealias RecipesResult = Result<[Recipe], Error>
typealias RecipesResultClosure = (Result<[Recipe], Error>) -> ()

protocol RecipeManagerProtocol {
    func getListOfRecipes(completion: @escaping RecipesResultClosure)
}

class RecipeManager: RecipeManagerProtocol {
    
    var resultsNumber: Int
    var mainIngredient: String
    private let session = URLSession.shared
    private lazy var jsonDecoder = JSONDecoder()
    private let networkManager: NetworkManager
    
    init(resultsNumber: Int, mainIngredient: String, networkManager: NetworkManager) {
        self.resultsNumber = resultsNumber
        self.mainIngredient = mainIngredient
        self.networkManager = networkManager
    }
    public func getListOfRecipes(completion: @escaping RecipesResultClosure) {
        
        var urlComponents = URLComponents(string: Constant.urlString)!
        urlComponents.queryItems = [
            URLQueryItem(name: "apiKey", value: Constant.apiKey),
            URLQueryItem(name: "ingredients", value: mainIngredient),
            URLQueryItem(name: "number", value: "\(resultsNumber)")
        ]
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        networkManager.resumeDataTask(withRequest: request) { result in
            switch result {
            case .success(let data):
                do {
                    let list = try self.jsonDecoder.decode([Recipe].self, from: data)
                    completion(.success(list))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
