//
//  Location+ViewVariablesTests.swift
//  WikiPlacesTests
//
//  Created by Erik Brandsma on 08/12/2025.
//

import DomainLayer
import Foundation
import Testing
@testable import WikiPlaces

struct LocationViewVariablesTests {
    enum Constants {
        static let amsterdam = Location(
            name: "Amsterdam",
            latitude: 52.3547498,
            longitude: 4.8339215
        )
        static let unnamedLocation = Location(
            name: nil,
            latitude: 40.4380638,
            longitude: -3.7495758
        )
    }
    
    @Test("Test location accessibilityLabel", arguments: [
        // Arrange
        (
            Constants.amsterdam,
            "Amsterdam. Coordinates are latitude: \(Constants.amsterdam.latitude), longitude: \(Constants.amsterdam.longitude). Tap to open in Wikipedia places."
        ),
        (
            Constants.unnamedLocation,
            "Unnamed location. Coordinates are latitude: \(Constants.unnamedLocation.latitude), longitude: \(Constants.unnamedLocation.longitude). Tap to open in Wikipedia places."
        )
    ])
    func testAccessibilityLabel(location: Location, expectedResult: String?) {
        // Act
        let result = location.accessibilityLabel
        
        // Assert
        #expect(result == expectedResult)
    }
    
    @Test("Test location title", arguments: [
        // Arrange
        (Constants.amsterdam, Constants.amsterdam.name),
        (Constants.unnamedLocation, "Unnamed location")
    ])
    func testTitle(location: Location, expectedResult: String?) async throws {
        // Act
        let result = location.title
        
        // Assert
        #expect(result == expectedResult)
    }
    
    @Test("Test location coordinatesAccessibilityLabel", arguments: [
        // Arrange
        (Constants.amsterdam, "latitude: \(Constants.amsterdam.latitude), longitude: \(Constants.amsterdam.longitude)"),
        (Constants.unnamedLocation, "latitude: \(Constants.unnamedLocation.latitude), longitude: \(Constants.unnamedLocation.longitude)")
    ])
    func testCoordinatesAccessibilityLabel(location: Location, expectedResult: String?) async throws {
        // Act
        let result = location.coordinatesAccessibilityLabel
        
        // Assert
        #expect(result == expectedResult)
    }
}
