//
//  LocationsView.swift
//  WikiPlaces
//
//  Created by Erik Brandsma on 10/12/2025.
//

import Foundation
import SwiftUI
import DomainLayer

public struct LocationsView: View {
    @StateObject var viewModel: LocationsViewModel = LocationsViewModel()
    @State private var customLatitude: String = ""
    @State private var customLongitude: String = ""
    
    public var body: some View {
        List {
            ModelLoadStateView(viewModel.modelLoadState) { identifyableLocations in
                ForEach(identifyableLocations) { identifyableLocation in
                    LocationListItem(location: identifyableLocation.location)
                }
            }
        }
        .accessibilityIdentifier("Locations_list")
        .onAppear {
            Task {
                await viewModel.loadLocations(clearCache: false)
            }
        }
        .refreshable {
            await viewModel.loadLocations(clearCache: true)
        }
    }
}


#Preview {
    LocationsView()
}
