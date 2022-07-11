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
    private let urlString = "https://api.spoonacular.com/recipes/findByIngredients"
    private let apiKey = "81698cfee0a340c5960b6c24b1f0ca8e"
    private let resultsNumber = 20
    private let mainIngredient = "beer"
    private let session = URLSession.shared
    private lazy var jsonDecoder = JSONDecoder()

    public func getListOfRecipes(completion: @escaping RecipesResultClosure) {
        
        var urlComponents = URLComponents(string: urlString)!
        urlComponents.queryItems = [
          URLQueryItem(name: "apiKey", value: apiKey),
          URLQueryItem(name: "ingredients", value: mainIngredient),
          URLQueryItem(name: "number", value: "\(resultsNumber)")
        ]

        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
               guard error == nil else {
                   completion(.failure(error!))
                   return
               }
                    
               guard let data = data else {
                   completion(.failure(NetworkError.emptyData))
                   return
               }
                    
              do {
                  let list = try self.jsonDecoder.decode([Recipe].self, from: data)
                  completion(.success(list))
              } catch let error {
                  completion(.failure(error))
              }
           })

           task.resume()
    }
}
