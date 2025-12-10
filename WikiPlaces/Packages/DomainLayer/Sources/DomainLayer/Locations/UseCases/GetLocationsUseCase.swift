//
//  GetLocationsUseCase.swift
//  DomainLayer
//
//  Created by Erik Brandsma on 09/12/2025.
//

public class GetLocationsUseCase {
    private let repository: LocationsRepositoryProtocol
    
    public init(repository: LocationsRepositoryProtocol) {
        self.repository = repository
    }
    
    public func callAsFunction(clearCache: Bool) async throws  -> [Location] {
        try await repository.getLocations(clearCache: clearCache)
    }
}
