//
//  MockAppStoreImpl.swift
//  NennosPizzaTests
//
//  Created by Rida Aftab on 23/11/2023.
//

import Foundation
@testable import NennosPizza

class MockAppStoreImp: AppDataStore {
    let success: Bool

    init(success: Bool) {
        self.success = success
    }
    
    func fetchPizzas(completion: @escaping (NennosPizza.ResultType<NennosPizza.Pizzas>) -> Void) {
        if success {
            let responseModel = pizzasModel
            completion(ResultType.success(responseModel))
        } else {
            completion(ResultType.failure(NetworkError(statusCode: 100, errorMessage: "something wrong happened")))
        }
    }
    
    func fetchIngredients(completion: @escaping (NennosPizza.ResultType<[NennosPizza.Ingredient]>) -> Void) {
        if success {
            let responseModel = allIngredientsModel
            completion(ResultType.success(responseModel))
        } else {
            completion(ResultType.failure(NetworkError(statusCode: 101, errorMessage: "something wrong happened")))
        }
    }
    
    func fetchDrinks(completion: @escaping (NennosPizza.ResultType<[NennosPizza.Drink]>) -> Void) {
        if success {
            let responseModel = allDrinksModel
            completion(ResultType.success(responseModel))
        } else {
            completion(ResultType.failure(NetworkError(statusCode: 102, errorMessage: "something wrong happened")))
        }
    }
    
    func createOrder(cart: NennosPizza.Cart, completion: @escaping (NennosPizza.ResultType<NennosPizza.EmptyResponseModel>) -> Void) {
        if success {
            completion(ResultType.success(EmptyResponseModel()))
        } else {
            completion(ResultType.failure(NetworkError(statusCode: 102, errorMessage: "something wrong happened")))
        }
    }
    
}
