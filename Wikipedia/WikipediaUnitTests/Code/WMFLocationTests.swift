import XCTest
@testable import WMF

class WMFLocationTests: XCTestCase {
    func testCoordinate() {
        // Arrange
        let expectedLatitude: Double = 52.3547498
        let expectedLongitude: Double = 4.8339215
        let location = WMFLocation(name: nil, latitude: expectedLatitude, longitude: expectedLongitude)
    
        // Act
        let result = location.coordinate
        
        // Assert
        XCTAssertEqual(result.latitude, expectedLatitude)
        XCTAssertEqual(result.longitude, expectedLongitude)
    }
    
    func testUserInfoInit() {
        // Arrange
        let expectedName = "Amsterdam"
        let expectedLatitude: Double = 52.3547498
        let expectedLongitude: Double = 4.8339215
        
        let userInfo: NSDictionary = [
            "location_name": "\(expectedName)",
            "location_latitude": "\(expectedLatitude)",
            "location_longitude": "\(expectedLongitude)"
        ]
        
        // Act
        let result = WMFLocation(userInfo: userInfo)
        
        // Assert
        XCTAssertEqual(result?.name, expectedName)
        XCTAssertEqual(result?.latitude, expectedLatitude)
        XCTAssertEqual(result?.longitude, expectedLongitude)
    }
}
