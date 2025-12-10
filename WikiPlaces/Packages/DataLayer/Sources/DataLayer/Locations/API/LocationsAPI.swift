//
//  LocationsAPI.swift
//  DataLayer
//
//  Created by Erik Brandsma on 09/12/2025.
//

import DomainLayer
import Foundation

public struct LocationsResponse: Codable, Sendable, Equatable {
    public let locations: [Location]
}

public class LocationsAPI: LocationsAPIProtocol {
    private let urlString: String
    private let dataFetcher: DataFetcher
    
    public init(
        urlString: String = "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json",
        dataFetcher: DataFetcher = URLSession.shared
    ) {
        self.urlString = urlString
        self.dataFetcher = dataFetcher
    }
    
    public func fetchLocations() async throws -> [Location] {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let data = try await dataFetcher.data(from: url)
        let decoder = JSONDecoder()
        let response = try decoder.decode(LocationsResponse.self, from: data)
        try? await Task.sleep(nanoseconds: 1 * 1_000_000_000)
        return response.locations
    }
}

