//
//  LocationsAPITests.swift
//  DataLayer
//
//  Created by Erik Brandsma on 09/12/2025.
//

@testable import DataLayer
import DataLayerMocks
import DomainLayer
import Foundation
import Testing

public struct LocationsAPITests {
    private let amsterdam = Location(
        name: "Amsterdam",
        latitude: 52.3547498,
        longitude: 4.8339215
    )
    
    @Test
    func testFetchLocations() async throws {
        // Arrange
        let expectedResult = [amsterdam]
        let encodedAmsterdam = try JSONEncoder().encode(LocationsResponse(locations: expectedResult))
        let mockDataFetcher = MockDataFetcher(result: .success(encodedAmsterdam))
        let sut = LocationsAPI(dataFetcher: mockDataFetcher)
        
        // Act
        let result = try await sut.fetchLocations()
        
        // Assert
        #expect(result == expectedResult)
    }
    
    
    @Test
    func testFetchLocationsBadURL() async throws {
        // Arrange
        let mockDataFetcher = MockDataFetcher(result: .failure(NSError(domain: "", code: 1, userInfo: [:])))
        let sut = LocationsAPI(urlString: "ht!tp://??", dataFetcher: mockDataFetcher)
        
        // Act
        do {
            let _ = try await sut.fetchLocations()
            Issue.record("fetchLocations should have thrown")
        } catch (let error as URLError) {
            // Assert
            #expect(error.code == URLError.badURL)
        } catch {
            Issue.record("Should have caught badURL")
        }
    }
}
