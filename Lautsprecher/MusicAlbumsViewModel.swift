//
//  MusicAlbumsViewModel.swift
//  Lautsprecher
//
//  Created by Ramūnas Jurgilas on 2022-05-27.
//

import Combine
import LTNetworking

class MusicAlbumsViewModel: ObservableObject {
    enum ViewState {
        case loading
        case loaded([MusicAlbum])
        case error(Error)
    }
    @Published var viewState: ViewState
    
    private var cancellable = [AnyCancellable]()
    
    init(viewState: ViewState = .loading) {
        self.viewState = viewState
    }
    
    func fetchMusicAlbums() {
        GetMusicAlbumsRequest().exe()
            .map { self.mapViewState($0) }
            .assign(to: \.viewState, on: self)
            .store(in: &cancellable)
    }
    
    private func mapViewState(_ result: Result<[MusicAlbum], Error>) -> ViewState {
        switch result {
        case .success(let musicAlbums):
            return .loaded(musicAlbums)
        case .failure(let error):
            return .error(error)
        }
    }
}
