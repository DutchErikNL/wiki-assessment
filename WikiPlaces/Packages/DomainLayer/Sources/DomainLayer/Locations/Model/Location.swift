//
//  Locations.swift
//  DomainLayer
//
//  Created by Erik Brandsma on 09/12/2025.
//

import Foundation

public struct Location: Codable, Equatable, Sendable {
    public let name: String?
    public let latitude: Double
    public let longitude: Double
    
    public init(
        name: String?,
        latitude: Double,
        longitude: Double
    ) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
    public enum CodingKeys: String, CodingKey {
        case name
        case latitude = "lat"
        case longitude = "long"
    }
}

extension Location {
    public var latitudeLongitudeTitle: String {
        "\(latitude), \(longitude)"
    }
    
    public var wikipediaPlacesURL: URL? {
        URL(string: "wikipedia://places?latitude=\(latitude)&latitude=\(longitude)")
    }
}
