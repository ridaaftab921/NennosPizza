//
//  DrinksViewControllerTests.swift
//  NennosPizzaTests
//
//  Created by Rida Aftab on 23/11/2023.
//

import XCTest
@testable import NennosPizza

final class DrinksViewControllerTests: XCTestCase {
    
    func testDrinksViewcontroller() {
        let viewModel = DrinksViewModel(dataStore: MockAppStoreImp(success: true))
        let vc = DrinksViewController(viewModel: viewModel)
        
        vc.loadViewIfNeeded()

        XCTAssertEqual(vc.getNumberRows(), 5)
        XCTAssertEqual(vc.nameAtRow(row: 0), "StillWater")
    }

}
private extension DrinksViewController {
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


final class ThankYouViewControllerTests: XCTestCase {
    func testDrinksViewcontroller() {
        let vc = ThankYouViewController()
        vc.loadViewIfNeeded()
        XCTAssertNotNil(vc)
    }
}
