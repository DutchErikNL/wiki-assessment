//
//  Locations.swift
//  DomainLayer
//
//  Created by Erik Brandsma on 09/12/2025.
//

import CoreLocation

public struct Location: Codable, Equatable, Sendable {
    public let name: String?
    public let lat: Double
    public let long: Double
    
    public init(
        name: String?,
        lat: Double,
        long: Double
    ) {
        self.name = name
        self.lat = lat
        self.long = long
    }
}
