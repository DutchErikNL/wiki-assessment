//
//  ContentView.swift
//  WikiPlaces
//
//  Created by Erik Brandsma on 08/12/2025.
//

import DataLayer
import SwiftUI
import DomainLayer

struct ContentView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
