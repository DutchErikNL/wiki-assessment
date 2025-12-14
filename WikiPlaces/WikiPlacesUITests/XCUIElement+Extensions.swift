//
//  XCUIElement+Extensions.swift
//  WikiPlaces
//
//  Created by Erik Brandsma on 14/12/2025.
//

import XCTest

extension XCUIElement {
    @discardableResult
    public func waitForExistanceFast(timeout: TimeInterval = 5.0) -> Bool {
        exists || waitForExistence(timeout: timeout)
    }
    
    public func tapWhenExists(timeout: TimeInterval = 5.0) {
        waitForExistanceFast(timeout: timeout)
        tap()
    }
}
