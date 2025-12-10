//
//  LocationsDatastoreTests.swift
//  DataLayer
//
//  Created by Erik Brandsma on 09/12/2025.
//

@testable import DataLayer
import DataLayerMocks
import DomainLayer
import Testing

public struct LocationsDatastoreTests {
    private let amsterdam = Location(
        name: "Amsterdam",
        latitude: 52.3547498,
        longitude: 4.8339215
    )
    private let mumbai = Location(
        name: "Mumbai",
        latitude: 19.0823998,
        longitude: 72.8111468
    )
    
    @Test
    func testGet() async {
        // Arrange
        let expectedResult = [mumbai]
        let sut = LocationsDatastore(locations: expectedResult)
        
        // Act
        let result = await sut.get()
        
        // Assert
        #expect(result == expectedResult)
    }
    
    @Test
    func testSet() async {
        // Arrange
        let expectedResult = [mumbai]
        let sut = LocationsDatastore(locations: nil)
        
        // Act
        await sut.set(expectedResult)
        
        // Assert
        #expect(await sut.get() == expectedResult)
    }
    
    @Test
    func testClear() async {
        // Arrange
        let sut = LocationsDatastore(locations: [mumbai])
        
        // Act
        await sut.clear()
        
        // Assert
        #expect(await sut.get() == nil)
    }
}
