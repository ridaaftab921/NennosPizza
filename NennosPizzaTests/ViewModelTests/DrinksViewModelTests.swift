//
//  DrinksViewModelTests.swift
//  NennosPizzaTests
//
//  Created by Rida Aftab on 23/11/2023.
//

import XCTest
@testable import NennosPizza

final class DrinksViewModelTests: XCTestCase {
    
    func testDrinksViewModel() {
        let viewModel =  DrinksViewModel(dataStore: MockAppStoreImp(success: true))
        viewModel.fetchDrinks { _ in }
        XCTAssertEqual(viewModel.getDrinksCount(), 5)
        XCTAssertEqual(viewModel.getDrink(atIndex: 0).name, "StillWater")
    }
    func testfailureCaseDrinksViewModel() {
        let viewModel = DrinksViewModel(dataStore: MockAppStoreImp(success: false))
        viewModel.fetchDrinks { _ in }
        XCTAssertEqual(viewModel.getDrinksCount(), 0)
    }
}
