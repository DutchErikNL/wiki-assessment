//
//  LocationsRepositoryTests.swift
//  DataLayer
//
//  Created by Erik Brandsma on 09/12/2025.
//

@testable import DataLayer
import DataLayerMocks
import DomainLayer
import Testing

public struct LocationsRepositoryTests {
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
    
    public init() {
    }
    
    @Test
    func testGetLocations() async throws {
        // Arrange
        let expectedResult = [amsterdam]
        let mockLocationsAPI = MockLocationsAPI(fetchLocationsResult: .success(expectedResult))
        let mockLocationsDataStore = MockLocationsDatastore(locations: nil)
        let sut = LocationsRepository(locationsAPI: mockLocationsAPI, locationsDataStore: mockLocationsDataStore)
        
        // Act
        let result = try await sut.getLocations(clearCache: false)
        
        // Assert
        #expect(result == expectedResult)
        #expect(await mockLocationsDataStore.nrOfTimesGetCalled == 1)
        #expect(await mockLocationsDataStore.nrOfTimesSetCalled == 1)
        #expect(await mockLocationsDataStore.nrOfTimesClearCalled == 0)
    }
    
    @Test
    func testGetLocationsClearCache() async throws {
        // Arrange
        let expectedResult = [mumbai]
        let mockLocationsAPI = MockLocationsAPI(fetchLocationsResult: .success(expectedResult))
        let mockLocationsDataStore = MockLocationsDatastore(locations: [amsterdam])
        let sut = LocationsRepository(locationsAPI: mockLocationsAPI, locationsDataStore: mockLocationsDataStore)
        
        // Act
        let result = try await sut.getLocations(clearCache: true)
        
        // Assert
        #expect(result == expectedResult)
        #expect(await mockLocationsDataStore.nrOfTimesClearCalled == 1)
        #expect(await mockLocationsDataStore.nrOfTimesGetCalled == 1)
        #expect(await mockLocationsDataStore.nrOfTimesSetCalled == 1)
    }
    
    @Test
    func testGetLocationsFromCache() async throws {
        // Arrange
        let expectedResult = [amsterdam]
        let mockLocationsAPI = MockLocationsAPI(fetchLocationsResult: .success([amsterdam]))
        let mockLocationsDataStore = MockLocationsDatastore(locations: expectedResult)
        let sut = LocationsRepository(locationsAPI: mockLocationsAPI, locationsDataStore: mockLocationsDataStore)
        
        // Act
        let result = try await sut.getLocations(clearCache: false)
        
        // Assert
        #expect(result == expectedResult)
        #expect(await mockLocationsDataStore.nrOfTimesClearCalled == 0)
        #expect(await mockLocationsDataStore.nrOfTimesGetCalled == 1)
        #expect(await mockLocationsDataStore.nrOfTimesSetCalled == 0)
    }
}
