//
//  WikiPlacesApp.swift
//  WikiPlaces
//
//  Created by Erik Brandsma on 08/12/2025.
//

import SwiftUI

@main
struct WikiPlacesApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                LocationsView()
                    .tabItem {
                        Label(String(localized: "Places"), systemImage: "mappin")
                    }
                
                CustomLocationView()
                    .tabItem {
                        Label(String(localized: "Custom place"), systemImage: "mappin.and.ellipse")
                    }
            }
        }
    }
}
