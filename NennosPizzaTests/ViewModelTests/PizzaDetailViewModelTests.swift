//
//  PizzaDetailViewModelTests.swift
//  NennosPizzaTests
//
//  Created by Rida Aftab on 23/11/2023.
//

import XCTest
@testable import NennosPizza

final class PizzaDetailViewModelTests: XCTestCase {
    
    func testPizzaDetailViewModel() {
        let viewModel = PizzaDetailViewModel(pizzaModel: ricciPizzaViewModel, ingredients: allIngredientsModel)
        
        XCTAssertEqual(viewModel.getIngredientPrice(atIndex: 0), 1.0)
        XCTAssertEqual(viewModel.pizzaModel.getImageUrl(), "")
        XCTAssertEqual(viewModel.getIngredientsCount(), 10)
        XCTAssertEqual(viewModel.isIngredientIncluded(index: 0), true)
    }
}
