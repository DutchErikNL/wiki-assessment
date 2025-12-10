//
//  LocationsViewModel.swift
//  WikiPlaces
//
//  Created by Erik Brandsma on 10/12/2025.
//

import Combine
import DataLayer
import DomainLayer
import Foundation
import UIKit

public struct IdentifiableLocation: Identifiable {
    public let id = UUID()
    public let location: Location
}

public class LocationsViewModel: ObservableObject {
    @Published public var modelLoadState: ModelLoadState<[IdentifiableLocation]> = ModelLoadState.loading
    private let getLocations: GetLocationsUseCase
    
    public init(getLocations: GetLocationsUseCase = GetLocationsUseCase()) {
        self.getLocations = getLocations
    }
    
    @MainActor
    public func loadLocations(clearCache: Bool = false) async {
        do {
            let result = try await getLocations(clearCache: clearCache)
            modelLoadState = .loaded(result.map { IdentifiableLocation(location: $0) })
        } catch {
            modelLoadState = .error(error)
        }
    }
}
