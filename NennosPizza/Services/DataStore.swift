//
//  DataStore.swift
//  NennosPizza
//
//  Created by Rida Aftab on 20/11/2023.
//

import Foundation
import Alamofire

protocol AppDataStore {
    func fetchPizzas(completion: @escaping (ResultType<Pizzas>) -> Void)
    func fetchIngredients(completion: @escaping (ResultType<[Ingredient]>) -> Void)
    func fetchDrinks(completion: @escaping (ResultType<[Drink]>) -> Void)
    func createOrder(cart: Cart, completion: @escaping (ResultType<EmptyResponseModel>) -> Void)
}

class AppDataStoreImpl {
    var networking: AlamofireNetworking
    
    init(_ networking: AlamofireNetworking) {
        self.networking = networking
    }
}

extension AppDataStoreImpl: AppDataStore {
    func fetchPizzas(completion: @escaping (ResultType<Pizzas>) -> Void) {
        let request = DataRequest(url: "https://doclerlabs.github.io/mobile-native-challenge/pizzas.json")
        networking.run(request) { (response: DataResponseModel<Pizzas>) in
            switch response.result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let response):
                completion(.success(response))
            }
        }
    }
    
    func fetchIngredients(completion: @escaping (ResultType<[Ingredient]>) -> Void) {
        let request = DataRequest(url: "https://doclerlabs.github.io/mobile-native-challenge/ingredients.json")
        networking.run(request) { (response: DataResponseModel<[Ingredient]>) in
            switch response.result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let response):
                completion(.success(response))
            }
        }
    }
    
    func fetchDrinks(completion: @escaping (ResultType<[Drink]>) -> Void) {
        let request = DataRequest(url: "https://doclerlabs.github.io/mobile-native-challenge/drinks.json")
        networking.run(request) { (response: DataResponseModel<[Drink]>) in
            switch response.result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let response):
                completion(.success(response))
            }
        }
    }
    
    func createOrder(cart: Cart, completion: @escaping (ResultType<EmptyResponseModel>) -> Void) {
        let requestModel = RequestModel(pizzas: cart.getPizzas(), drinks: cart.getDrinkIds())
        let request = DataRequest(url: "http://httpbin.org/post", method: .post, object: requestModel)
        networking.run(request) { (response: DataResponseModel<EmptyResponseModel>) in
            switch response.result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let response):
                completion(.success(response))
            }
            
        }
    }
}
