//
//  LocationTests.swift
//  DomainLayer
//
//  Created by Erik Brandsma on 13/12/2025.
//

@testable import DomainLayer
import Foundation
import Testing

public struct LocationTests {
    @Test("Test coordinate string init", arguments: [
        // Arrange
        (
            latitude: "52.3547498",
            longitude: "4.8339215",
            expectedResult: Location(name: nil, latitude: 52.3547498, longitude: 4.8339215)
        ),
        (
            latitude: "",
            longitude: "",
            expectedResult: Optional<Location>(nil)
        ),
        (
            latitude: "abc",
            longitude: "42.1536",
            expectedResult: Optional<Location>(nil)
        )
    ])
    func testCoordinateStringInit(
        latitude: String,
        longitude: String,
        expectedResult: Location?
    ) {
        // Act
        let result = Location(name: nil, latitudeStr: latitude, longitudeStr: longitude)
        
        // Assert
        #expect(result == expectedResult)
    }
    
    @Test("Test latitude longitude title", arguments: [
        // Arrange
        (
            location: Location(
                name: nil,
                latitude: 52.3547498,
                longitude: 4.8339215
            ),
            expectedResult: "52.3547498, 4.8339215"
        )
    ])
    func testLatitudeLongitudeTitle(
        location: Location,
        expectedResult: String
    ) {
        // Act
        let result = location.latitudeLongitudeTitle
        
        // Assert
        #expect(result == expectedResult)
    }
    
    @Test("Test wikipediaPlacesURL", arguments: [
        // Arrange
        (
            location: Location(
                name: "Amsterdam",
                latitude: 52.3547498,
                longitude: 4.8339215
            ),
            expectedResult: "wikipedia://places?location_latitude=52.3547498&location_longitude=4.8339215&location_name=Amsterdam"
        ),
        (
            location: Location(
                name: nil,
                latitude: 52.3547498,
                longitude: 4.8339215
            ),
            expectedResult: "wikipedia://places?location_latitude=52.3547498&location_longitude=4.8339215"
        )
    ])
    func testWikipediaPlacesURL(
        location: Location,
        expectedResult: String
    ) {
        // Act
        let result = location.wikipediaPlacesURL?.absoluteString
        
        // Assert
        #expect(result == expectedResult)
    }
}
