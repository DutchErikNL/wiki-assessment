//
//  WikiPlacesAccessibilityUITests.swift
//  WikiPlacesUITests
//
//  Created by Erik Brandsma on 08/12/2025.
//

import XCTest

@available(iOS 17.0, *)
final class WikiPlacesAccessibilityUITests: XCTestCase {
    // Unfortunately MapKit doesn't support dynamicType
    let auditTypes = XCUIAccessibilityAuditType.all.subtracting(.dynamicType)
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = true
    }
    
    func testAutoAccessibilityAuditPlaces() throws {
        // Arrange
        let app = XCUIApplication()
        app.launch()
        let list = app.tables["Locations_list"]
        let predicate = NSPredicate(format: "count > 0")
        let expectation = XCTNSPredicateExpectation(
            predicate: predicate,
            object: list.cells
        )
        XCTWaiter().wait(for: [expectation], timeout: 5)
        
        // Act
        // Assert
        try app.performAccessibilityAudit(for: auditTypes)
    }
    
    func testAutoAccessibilityAuditCustomPlace() throws {
        // Arrange
        let app = XCUIApplication()
        app.launch()
        app.buttons.containing(.button, identifier: "mappin.and.ellipse").firstMatch.tapWhenExists()
        
        // Act
        // Assert
        try app.performAccessibilityAudit(for: auditTypes)
    }
}
