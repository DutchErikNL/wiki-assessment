//
//  MockLocationsRepository.swift
//  DataLayer
//
//  Created by Erik Brandsma on 09/12/2025.
//

import DomainLayer

public class MockLocationsRepository: LocationsRepositoryProtocol {
    public var result: Result<[Location], Error>
    public var lastCalledWithClearCache: Bool? = nil
    
    public init(result: Result<[Location], Error>) {
        self.result = result
    }
    
    public func getLocations(clearCache: Bool) async throws -> [Location] {
        lastCalledWithClearCache = clearCache
        
        switch result {
        case .success(let locations):
            return locations
        case .failure(let error):
            throw error
        }
    }
}
