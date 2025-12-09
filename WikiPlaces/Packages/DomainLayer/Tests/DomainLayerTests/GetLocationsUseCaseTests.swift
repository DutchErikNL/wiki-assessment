@testable import DomainLayer
import DomainLayerMocks
import Foundation
import Testing

public struct GetLocationsUseCaseTests {
    private let amsterdam = Location(
        name: "Amsterdam",
        lat: 52.3547498,
        long: 4.8339215
    )

    @Test
    func testGetLocationsHappyFlow() async throws {
        // Arrange
        let expectedResult = [amsterdam]
        let expectedClearCache = true
        let mockRepository = MockLocationsRepository(result: .success(expectedResult))
        let sut = GetLocationsUseCase(repository: mockRepository)
        
        // Act
        let result = try await sut.getLocations(clearCache: expectedClearCache)
        
        // Assert
        #expect(result == expectedResult)
        #expect(mockRepository.lastCalledWithClearCache == expectedClearCache)
    }
    
    @Test
    func testGetLocationsUnhappyFlow() async throws {
        // Arrange
        let expectedError = NSError(domain: "", code: 1)
        let expectedClearCache = false
        let mockRepository = MockLocationsRepository(result: .failure(expectedError))
        let sut = GetLocationsUseCase(repository: mockRepository)
        
        // Act
        do {
            let _ = try await sut.getLocations(clearCache: expectedClearCache)
            Issue.record("getLocations should throw")
        } catch(let error as NSError) {
            // Assert
            #expect(error == expectedError)
            #expect(mockRepository.lastCalledWithClearCache == expectedClearCache)
        } catch {
            Issue.record("NSError should have been thrown")
        }        
    }
}

