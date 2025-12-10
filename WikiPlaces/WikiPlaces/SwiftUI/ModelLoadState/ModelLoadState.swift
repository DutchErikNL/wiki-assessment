//
//  ModelLoadState.swift
//  Core
//
//  Created by Erik Brandsma on 10/10/2025.
//

public enum ModelLoadState<ModelType> {
    case initial
    case loading
    case error(Error)
    case loaded(ModelType)
}
