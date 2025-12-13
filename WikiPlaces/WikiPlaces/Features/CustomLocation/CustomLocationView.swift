//
//  CustomLocationView.swift
//  WikiPlaces
//
//  Created by Erik Brandsma on 13/12/2025.
//

import Foundation
import SwiftUI
import DomainLayer

public struct CustomLocationView: View {
    @Environment(\.openURL) var openURL
    @State private var customLatitude: String = ""
    @State private var customLongitude: String = ""
    @State private var showCantOpenURLAlert = false
    
    public var body: some View {
        List {
            TextField(text: $customLatitude) {
                Text(String(localized: "Latitude"))
            }
            TextField(text: $customLongitude) {
                Text(String(localized: "Longitude"))
            }
            Button {
                guard
                    let url = Location(
                        name: nil,
                        latitudeStr: customLatitude,
                        longitudeStr: customLongitude
                    )?.wikipediaPlacesURL
                else {
                    showCantOpenURLAlert = true
                    return
                }
                
                openURL(url)
            } label: {
                Text(String(localized: "Open Wikipedia"))
                    .font(.title)
                    .bold()
            }
            .alert(String(localized: "Can't open"), isPresented: $showCantOpenURLAlert) {
                Button(String(localized: "OK"), role: .cancel) { }
            } message: {
                Text(String(localized: "We couldn't parse the coordinates!"))
            }
        }
    }
}

#Preview {
    CustomLocationView()
}
