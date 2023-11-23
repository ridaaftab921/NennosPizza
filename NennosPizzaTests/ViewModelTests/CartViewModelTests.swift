//
//  CartViewModelTests.swift
//  NennosPizzaTests
//
//  Created by Rida Aftab on 23/11/2023.
//


import XCTest
@testable import NennosPizza

final class CartViewModelTests: XCTestCase {
    
    func testemptyCartViewModel() {
        let cart = emptyCart
        let viewModel = CartViewModel(cart: cart, dataStore: MockAppStoreImp(success: true))
        XCTAssertEqual(viewModel.isCartEmpty(), true)
    }
    
    func testfullCartViewModel() {
        let viewModel = CartViewModel(cart: filledCart, dataStore: MockAppStoreImp(success: true))
        
        viewModel.createOrder { _ in }
        
        XCTAssertEqual(viewModel.isCartEmpty(), false)
        XCTAssertEqual(viewModel.getPizza(atIndex: 0).getName(), "Margherita")
        XCTAssertEqual(viewModel.getDrink(atIndex: 0).name, "StillWater")
    }
    
    func testfailureCaseCartViewModel() {
        let cart = emptyCart
        let _ = CartViewModel(cart: cart, dataStore: MockAppStoreImp(success: false))
    }
}
