//
//  MockDataFetcher.swift
//  DataLayer
//
//  Created by Erik Brandsma on 09/12/2025.
//

import DataLayer
import Foundation

public class MockDataFetcher: DataFetcher {
    public var result: Result<Data, Error>
    
    public init(result: Result<Data, Error>) {
        self.result = result
    }
    
    public func data(from url: URL) async throws -> Data {
        switch result {
        case .success(let data):
            return data
            
        case .failure(let error):
            throw error
        }
    }
}
