//
//  HomeViewControllerTests.swift
//  NennosPizzaTests
//
//  Created by Rida Aftab on 23/11/2023.
//

import XCTest
@testable import NennosPizza

final class HomeViewControllerTests: XCTestCase {
    
    func testHomeViewController() {
        let viewModel = HomeViewModel(dataStore: MockAppStoreImp(success: true))
        let vc = HomeViewController(viewModel: viewModel)
        
        vc.loadViewIfNeeded()
        
        XCTAssertEqual(vc.getNumberRows(), 10)
        XCTAssertEqual(vc.nameAtRow(row: 0), "Margherita")
    }
}

private extension HomeViewController {
    func getNumberRows() -> Int {
        return pizzasTableView.numberOfRows(inSection: 0)
    }
        
    func getPizzaCell(index: Int) -> PizzaCell? {
        let ds = pizzasTableView.dataSource
        return ds?.tableView(pizzasTableView, cellForRowAt: IndexPath(row: index, section: 0)) as? PizzaCell
    }
    
    func nameAtRow(row: Int) -> String {
        let cell = getPizzaCell(index: row)
        return cell?.nameLabel.text ?? ""
    }
}
