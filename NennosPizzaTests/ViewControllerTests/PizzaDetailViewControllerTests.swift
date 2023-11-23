//
//  PizzaDetailViewControllerTests.swift
//  NennosPizzaTests
//
//  Created by Rida Aftab on 23/11/2023.
//

import XCTest
@testable import NennosPizza

final class PizzaDetailViewControllerTests: XCTestCase {
    
    func testPizzaDetailViewcontroller() {
        
        let viewModel = PizzaDetailViewModel(pizzaModel: margheritaPizzaViewModel, ingredients: allIngredientsModel)
        let vc = PizzaDetailViewController(viewModel: viewModel)
        
        vc.loadViewIfNeeded()

        XCTAssertEqual(vc.getNumberRows(), 10)
        XCTAssertEqual(vc.nameAtRow(row: 0), "Mozzarella")
    }
}
private extension PizzaDetailViewController {
    func getNumberRows() -> Int {
        return tableView.numberOfRows(inSection: 0)
    }
        
    func getItemCell(index: Int) -> ItemCell? {
        let ds = tableView.dataSource
        return ds?.tableView(tableView, cellForRowAt: IndexPath(row: index, section: 0)) as? ItemCell
    }
    
    func nameAtRow(row: Int) -> String {
        let cell = getItemCell(index: row)
        return cell?.nameLabel.text ?? ""
    }
}
