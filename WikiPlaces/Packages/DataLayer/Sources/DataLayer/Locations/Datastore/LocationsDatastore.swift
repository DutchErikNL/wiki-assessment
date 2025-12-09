//
//  LocationsDatastore.swift
//  DataLayer
//
//  Created by Erik Brandsma on 09/12/2025.
//

import DomainLayer
import Foundation

public actor LocationsDatastore: LocationsDatastoreProtocol {
    public static let shared = LocationsDatastore()
    
    private var locations: [Location]?
    
    public init(
        locations: [Location]? = nil
    ) {
        self.locations = locations
    }
    
    public func get() async -> [Location]? {
        locations
    }
    
    public func set(_ locations: [Location]) async {
        self.locations = locations
    }
    
    public func clear() async {
        locations = nil
    }
}
