//
//  HomeViewModelTests.swift
//  NennosPizzaTests
//
//  Created by Rida Aftab on 22/11/2023.
//

import XCTest
@testable import NennosPizza

class HomeViewModelTests: XCTestCase {
    
    func testHomeViewModel() {
        let viewModel = HomeViewModel(dataStore: MockAppStoreImp(success: true))
        
        viewModel.fetchPizzas { _ in }
        XCTAssertNotNil(viewModel.getPizzas())
        XCTAssertEqual(viewModel.getPizza(atIndex: 0).name, "Margherita")
        XCTAssertEqual(viewModel.getPizzasCount(), 10)
        XCTAssertEqual(viewModel.getPizzaModel(atIndex: 0).getPrice(), "$6")
        XCTAssertEqual(viewModel.getPizzaModel(atIndex: 0).getIngredientsString(), "Mozzarella, TomatoSauce")
        XCTAssertEqual(viewModel.getPizzaModel(atIndex: 0).getImageUrl(), "https://doclerlabs.github.io/mobile-native-challenge/images/pizza_PNG44095.png")
        XCTAssertEqual(viewModel.getAllingredients().count, 10)
    }
    func testfailureCaseCartViewModel() {
        let viewModel = HomeViewModel(dataStore: MockAppStoreImp(success: false))
        viewModel.fetchPizzas { _ in }
        XCTAssertNil(viewModel.getPizzas())
    }
}

extension HomeViewModel {
    
    func getPizzas() -> Pizzas? {
        return self.pizzas
    }
    
    func getPizza(atIndex index: Int) -> Pizza {
        return (self.pizzas?.pizzas[index])!
    }
}
