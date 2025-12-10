//
//  Location+View.swift
//  WikiPlaces
//
//  Created by Erik Brandsma on 10/12/2025.
//

import DomainLayer
import Foundation

extension Location {
    public var accessibilityLabel: String {
        let format = String(localized: "LocationListItemAccessibilityLabel")
        return String(format: format, "\(title)", coordinatesAccessibilityLabel)
    }
    
    public var title: String {
        name ?? String(localized: "UnnamedLocation")
    }
    
    public var coordinatesAccessibilityLabel: String {
        let format = String(localized: "LatituteLongitudeAccessibilityLabel")
        return String(format: format, "\(latitude)", "\(longitude)")
    }
}
