//
//  GetLocationsUseCase+DependencyInjection.swift
//  WikiPlaces
//
//  Created by Erik Brandsma on 09/12/2025.
//

import DataLayer
import DomainLayer

extension GetLocationsUseCase {
    public convenience init() {
        self.init(repository: LocationsRepository())
    }
}
