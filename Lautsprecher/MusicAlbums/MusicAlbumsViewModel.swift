//
//  MusicAlbumsViewModel.swift
//  Lautsprecher
//
//  Created by Ramūnas Jurgilas on 2022-05-27.
//

import Combine
import LTNetworking

class MusicAlbumsViewModel: ObservableObject, ViewStateRepresenter {
    @Published var viewState: ViewState<[MusicAlbum]>
    
    private var cancellable = [AnyCancellable]()
    
    init(viewState: ViewState<[MusicAlbum]> = .loading) {
        self.viewState = viewState
    }
    
    func fetchMusicAlbums() {
        GetMusicAlbumsRequest().exe()
            .map { self.mapViewState($0) }
            .assign(to: \.viewState, on: self)
            .store(in: &cancellable)
    }
    
    private func mapViewState(_ result: Result<[MusicAlbum], Error>) -> ViewState<[MusicAlbum]> {
        switch result {
        case .success(let musicAlbums):
            return .loaded(musicAlbums)
        case .failure(let error):
            return .error(error)
        }
    }
}
