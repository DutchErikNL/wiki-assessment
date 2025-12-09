//
//  MockLocationsAPI.swift
//  DataLayer
//
//  Created by Erik Brandsma on 09/12/2025.
//

import DataLayer
import DomainLayer

public class MockLocationsAPI: LocationsAPIProtocol {
    public var fetchLocationsResult: Result<[Location], Error>
    
    public init(fetchLocationsResult: Result<[Location], Error> = .success([])) {
        self.fetchLocationsResult = fetchLocationsResult
    }
    
    public func fetchLocations() async throws -> [Location] {
        switch fetchLocationsResult {
        case .success(let locations):
            return locations
            
        case .failure(let error):
            throw error
        }
    }
}
