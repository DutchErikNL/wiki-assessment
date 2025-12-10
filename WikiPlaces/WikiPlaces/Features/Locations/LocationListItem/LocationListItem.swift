//
//  LocationListItem.swift
//  WikiPlaces
//
//  Created by Erik Brandsma on 10/12/2025.
//

import Foundation
import SwiftUI
import DomainLayer

public struct LocationListItem: View {
    @Environment(\.openURL) var openURL

    public let location: Location
    
    public var body: some View {
        Button {
            if let url = location.wikipediaPlacesURL {
                openURL(url)
            }
        } label: {
            buttonContent
        }
        .accessibilityLabel(location.accessibilityLabel)
        .accessibilityElement(children: .combine)
        .accessibilityHint(String(localized: "LocationListItemAccessibilityHint"))
    }
    
    private var buttonContent: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(location.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(location.latitudeLongitudeTitle)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
    }
}
