//
//  LocationsRepositoryProtocol.swift
//  DomainLayer
//
//  Created by Erik Brandsma on 09/12/2025.
//

import Foundation

public protocol LocationsRepositoryProtocol {
    func getLocations(clearCache: Bool) async throws -> [Location]
}
