//
//  AlbumDetailViewModel.swift
//  Lautsprecher
//
//  Created by Ramūnas Jurgilas on 2022-05-27.
//

import SwiftUI
import Combine
import LTNetworking

class AlbumDetailViewModel: ObservableObject, ViewStateRepresenter {
    let url: URL?
    
    @Published var viewState: ViewState<Image>
    
    private var cancellable = [AnyCancellable]()
    
    init(url: URL?) {
        self.url = url
        self.viewState = .loading
    }
    
    func getCoverArt() {
        GetCoverArtDetail(url: url!).exe()
            .map { self.mapViewState($0) }
            .assign(to: \.viewState, on: self)
            .store(in: &cancellable)
    }
}
