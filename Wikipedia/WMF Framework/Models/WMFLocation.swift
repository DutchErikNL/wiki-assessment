//
//  WMFLocation.swift
//  Wikipedia
//
//  Created by Erik Brandsma on 12/12/2025.
//

import Foundation
import MapKit

@objc(WMFLocation)
public final class WMFLocation: NSObject, Sendable {
    @objc public let name: String?
    @objc public let latitude: Double
    @objc public let longitude: Double
    
    @objc public var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    @objc public init(
        name: String?,
        latitude: Double,
        longitude: Double
    ) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
    @objc convenience init?(userInfo: NSDictionary) {
        let name = userInfo["location_name"] as? String
        
        guard
            let latitudeStr = userInfo["location_latitude"] as? String,
            let longitudeStr = userInfo["location_longitude"] as? String,
            let latitude = Double(latitudeStr),
            let longitude = Double(longitudeStr)
        else {
            return nil
        }
        
        self.init(name: name, latitude: latitude, longitude: longitude)
    }
}
