//
//  LocationListItem.swift
//  WikiPlaces
//
//  Created by Erik Brandsma on 10/12/2025.
//

import Foundation
import MapKit
import SwiftUI
import DomainLayer

public struct LocationListItem: View {
    @Environment(\.openURL) var openURL
    
    public let location: Location
    
    public var body: some View {
        buttonContent
            .contentShape(Rectangle())
            .onTapGesture {
                if let url = location.wikipediaPlacesURL {
                    openURL(url)
                }
            }
            .accessibilityLabel(location.accessibilityLabel)
            .accessibilityElement(children: .combine)
            .accessibilityHint(String(localized: "LocationListItemAccessibilityHint"))
    }
    
    private var buttonContent: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(location.title)
                        .font(.title2)
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
            
            mapView
        }
    }
    
    private var mapView: some View {
        Map(
            coordinateRegion: .constant(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: location.latitude,
                        longitude: location.longitude
                    ),
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.25,
                        longitudeDelta: 0.25
                    )
                )
            )
        )
        .frame(height: 100)
        .cornerRadius(8)
        .allowsHitTesting(false)
    }
}
