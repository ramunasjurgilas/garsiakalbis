//
//  ViewStateRepresenter+extension.swift
//  Lautsprecher
//
//  Created by Ramūnas Jurgilas on 2022-05-27.
//

import SwiftUI

extension ViewStateRepresenter {
    @ViewBuilder
    func errorView(systemImageName: String, errorMessage: String) -> some View {
        Image(systemName: "photo")
            .resizable()
            .frame(width: 200, height: 200)
        Text(errorMessage)
    }
    
    func mapViewState(_ result: Result<T, Error>) -> ViewState<T> {
        switch result {
        case .success(let image):
            return .loaded(image)
        case .failure(let error):
            return .error(error)
        }
    }
}
