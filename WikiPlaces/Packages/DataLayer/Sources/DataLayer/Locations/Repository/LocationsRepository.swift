//
//  LocationsRepository.swift
//  DataLayer
//
//  Created by Erik Brandsma on 09/12/2025.
//

import DomainLayer

public class LocationsRepository: LocationsRepositoryProtocol {
    private let locationsAPI: LocationsAPIProtocol
    private let locationsDataStore: LocationsDatastoreProtocol
    
    public init(
        locationsAPI: LocationsAPIProtocol = LocationsAPI(),
        locationsDataStore: LocationsDatastoreProtocol = LocationsDatastore.shared
    ) {
        self.locationsAPI = locationsAPI
        self.locationsDataStore = locationsDataStore
    }
    
    public func getLocations(clearCache: Bool) async throws -> [DomainLayer.Location] {
        if clearCache {
            await locationsDataStore.clear()
        }
        
        if let cached = await locationsDataStore.get() {
            return cached
        }
        
        let result = try await locationsAPI.fetchLocations()
        await locationsDataStore.set(result)
        return result
    }
}
