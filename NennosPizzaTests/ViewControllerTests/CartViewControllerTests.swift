//
//  CartViewControllerTests.swift
//  NennosPizzaTests
//
//  Created by Rida Aftab on 23/11/2023.
//

import XCTest
@testable import NennosPizza

final class CartViewControllerTests: XCTestCase {
    
    func testCartViewController() {
        let viewModel = CartViewModel(cart: filledCart, dataStore: MockAppStoreImp(success: true))
        let vc = CartViewController(viewModel: viewModel)
        
        vc.loadViewIfNeeded()
        
        XCTAssertEqual(vc.getNumberSections(), 2)
        XCTAssertEqual(vc.getNumberRows(inSection: vc.pizzaSection), 1)
        XCTAssertEqual(vc.getNumberRows(inSection: vc.drinkSection), 1)
        XCTAssertEqual(vc.nameAtRow(row: 0, section: vc.pizzaSection), "Margherita")
        XCTAssertEqual(vc.nameAtRow(row: 0, section: vc.drinkSection), "StillWater")
    }
}
private extension CartViewController {
    var pizzaSection: Int { return 0 }
    var drinkSection: Int { return 1 }

    func getNumberSections() -> Int {
        return tableView.numberOfSections
    }
    
    func getNumberRows(inSection section: Int) -> Int {
        return tableView.numberOfRows(inSection: section)
    }
        
    func getItemCell(index: Int, section: Int) -> ItemCell? {
        let ds = tableView.dataSource
        return ds?.tableView(tableView, cellForRowAt: IndexPath(row: index, section: section)) as? ItemCell
    }
    
    func nameAtRow(row: Int, section: Int) -> String {
        let cell = getItemCell(index: row, section: section)
        return cell?.nameLabel.text ?? ""
    }
}
