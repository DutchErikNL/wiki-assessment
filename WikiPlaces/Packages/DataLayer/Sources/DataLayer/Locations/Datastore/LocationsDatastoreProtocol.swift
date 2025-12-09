//
//  LocationsDatastoreProtocol.swift
//  DataLayer
//
//  Created by Erik Brandsma on 09/12/2025.
//

import DomainLayer

public protocol LocationsDatastoreProtocol {
    func get() async -> [Location]?
    func set(_ locations: [Location]) async
    func clear() async
}
