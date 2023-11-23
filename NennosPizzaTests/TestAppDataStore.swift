//
//  TestAppDataStore.swift
//  NennosPizzaTests
//
//  Created by Rida Aftab on 23/11/2023.
//

import XCTest
@testable import NennosPizza

final class TestAppDataStore: XCTestCase {

    func testSuccessFetchPizzas() {
        let responseModel = pizzasModel
        let mockNetworkingObject = NetworkingMockObject(success: true, response: responseModel)
        let dataStore  = AppDataStoreImpl(mockNetworkingObject)
        
        dataStore.fetchPizzas { response  in
            switch response {
            case .success(let pizzas):
                XCTAssertNotNil(pizzas)
            case .failure( _):
                break
            }
        }
    }
    func testFailureFetchPizzas() {
        let responseModel = pizzasModel
        let mockNetworkingObject = NetworkingMockObject(success: false, response: responseModel)
        let dataStore  = AppDataStoreImpl(mockNetworkingObject)
        
        dataStore.fetchPizzas { response  in
            switch response {
            case .success( _):
                break
            case .failure(let error):
                XCTAssertEqual(error.statusCode, 100)
            }
        }
    }
    
    func testSuccessFetchIngredients() {
        let responseModel = allIngredientsModel
        let mockNetworkingObject = NetworkingMockObject(success: true, response: responseModel)
        let dataStore  = AppDataStoreImpl(mockNetworkingObject)
        
        dataStore.fetchIngredients { response  in
            switch response {
            case .success(let ingredients):
                XCTAssertNotNil(ingredients)
            case .failure( _):
                break
            }
        }
    }
    func testFailureFetchIngredients() {
        let responseModel = allIngredientsModel
        let mockNetworkingObject = NetworkingMockObject(success: false, response: responseModel)
        let dataStore  = AppDataStoreImpl(mockNetworkingObject)
        
        dataStore.fetchIngredients { response  in
            switch response {
            case .success( _):
                break
            case .failure(let error):
                XCTAssertEqual(error.statusCode, 100)
            }
        }
    }

    func testSuccessFetchDrinks() {
        let responseModel = allDrinksModel
        let mockNetworkingObject = NetworkingMockObject(success: true, response: responseModel)
        let dataStore  = AppDataStoreImpl(mockNetworkingObject)
        
        dataStore.fetchDrinks { response  in
            switch response {
            case .success(let ingredients):
                XCTAssertNotNil(ingredients)
            case .failure( _):
                break
            }
        }
    }
    func testFailureFetchDrinks() {
        let responseModel = allDrinksModel
        let mockNetworkingObject = NetworkingMockObject(success: false, response: responseModel)
        let dataStore  = AppDataStoreImpl(mockNetworkingObject)
        
        dataStore.fetchDrinks { response  in
            switch response {
            case .success( _):
                break
            case .failure(let error):
                XCTAssertEqual(error.statusCode, 100)
            }
        }
    }
    
    func testSuccessCreateOrder() {
        let responseModel = EmptyResponseModel()
        let mockNetworkingObject = NetworkingMockObject(success: true, response: responseModel)
        let dataStore  = AppDataStoreImpl(mockNetworkingObject)
        
        let cart = emptyCart
        cart.add(drink: stillWaterDrink)
        cart.add(pizza: margheritaPizzaViewModel)
        
        dataStore.createOrder(cart: cart) { response  in
            switch response {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure( _):
                break
            }
        }
    }
    func testFailureCreateOrder() {
        let responseModel = EmptyResponseModel()
        let mockNetworkingObject = NetworkingMockObject(success: false, response: responseModel)
        let dataStore  = AppDataStoreImpl(mockNetworkingObject)
        
        let cart = emptyCart
        cart.add(drink: stillWaterDrink)
        cart.add(pizza: margheritaPizzaViewModel)
        
        dataStore.createOrder(cart: cart) { response  in
            switch response {
            case .success( _):
                break
            case .failure(let error):
                XCTAssertEqual(error.statusCode, 100)
            }
        }
    }
}
