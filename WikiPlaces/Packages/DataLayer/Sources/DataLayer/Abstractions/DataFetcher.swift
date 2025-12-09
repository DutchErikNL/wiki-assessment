//
//  DataFetcher.swift
//  DataLayer
//
//  Created by Erik Brandsma on 09/12/2025.
//

import Foundation

public protocol DataFetcher {
    func data(
        from url: URL,
    ) async throws -> Data
}

extension URLSession: DataFetcher {
    public func data(from url: URL) async throws -> Data {
        try await data(from: url, delegate: nil).0
    }
}
