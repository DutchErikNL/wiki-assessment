//
//  LocationsAPIProtocol.swift
//  DataLayer
//
//  Created by Erik Brandsma on 09/12/2025.
//

import DomainLayer

public protocol LocationsAPIProtocol {
    func fetchLocations() async throws -> [Location]
}
