//
//  MockLocationsDatastore.swift
//  DataLayer
//
//  Created by Erik Brandsma on 09/12/2025.
//

import DataLayer
import DomainLayer

public actor MockLocationsDatastore: LocationsDatastoreProtocol {
    public private(set) var locations: [Location]?
    public private(set) var nrOfTimesGetCalled: Int = 0
    public private(set) var nrOfTimesSetCalled: Int = 0
    public private(set) var nrOfTimesClearCalled: Int = 0

    public init(
        locations: [Location]? = nil
    ) {
        self.locations = locations
    }
    
    public func get() async -> [Location]? {
        nrOfTimesGetCalled += 1
        return locations
    }
    
    public func set(_ locations: [Location]) {
        nrOfTimesSetCalled += 1
        self.locations = locations
    }
    
    public func clear() {
        nrOfTimesClearCalled += 1
        self.locations = nil
    }
}
