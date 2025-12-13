//
//  WikiPlacesAccessibilityUITests.swift
//  WikiPlacesUITests
//
//  Created by Erik Brandsma on 08/12/2025.
//

import XCTest

@available(iOS 17.0, *)
final class WikiPlacesAccessibilityUITests: XCTestCase {
    override func setUp() {
        super.setUp()
        continueAfterFailure = true
    }
    
    func testAutoAccessibilityAuditPlaces() throws {
        let app = XCUIApplication()
        app.launch()
        let list = app.tables["Locations_list"]
        let predicate = NSPredicate(format: "count > 0")
        let expectation = XCTNSPredicateExpectation(
            predicate: predicate,
            object: list.cells
        )
        
        XCTWaiter().wait(for: [expectation], timeout: 5)
        try app.performAccessibilityAudit(for: .all)
    }
    
    func testAutoAccessibilityAuditCustomPlace() throws {
        let app = XCUIApplication()
        app.launch()
        app.tabBars.buttons["Custom place"].tap()

        try app.performAccessibilityAudit(for: .all)
    }
}
