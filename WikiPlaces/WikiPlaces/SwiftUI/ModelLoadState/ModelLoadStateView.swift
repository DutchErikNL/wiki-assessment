//
//  Untitled.swift
//  Core
//
//  Created by Erik Brandsma on 10/10/2025.
//

import SwiftUI

public struct ModelLoadStateView<Content, T>: View where Content: View {
    private let content: (T) -> Content
    public let modelLoadState: ModelLoadState<T>
    
    public var body: some View {
        switch modelLoadState {
        case .initial, .loading:
            loadingView
            
        case .error(let error):
            errorView(error)
            
        case .loaded(let model):
            content(model)
        }
    }
    
    private var loadingView: some View {
        HStack(spacing: 12) {
            ProgressView()
            Text(String(localized: "Loading..."))
                .font(.body)
                .foregroundStyle(.secondary)
        }.padding()
    }
    
    public init(
        _ modelLoadState: ModelLoadState<T>,
        @ViewBuilder content: @escaping (T) -> Content
    ) {
        self.modelLoadState = modelLoadState
        self.content = content
    }
    
    @ViewBuilder
    private func errorView(_ error: Error) -> some View {
        Text("\(error.localizedDescription)")
    }
}
