//
//  AlbumDetailView.swift
//  Lautsprecher
//
//  Created by Ramūnas Jurgilas on 2022-05-27.
//

import SwiftUI
import LTNetworking

import Combine
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
    
    private func mapViewState(_ result: Result<Image, Error>) -> ViewState<Image> {
        switch result {
        case .success(let image):
            return .loaded(image)
        case .failure(let error):
            return .error(error)
        }
    }
}

struct AlbumDetailView: View {
    @StateObject var viewModel: AlbumDetailViewModel
    
    var body: some View {
        Group {
            switch viewModel.viewState {
            case .error(let error):
                viewModel.errorView(systemImageName: "photo", errorMessage: error.localizedDescription)
            case .loading:
                ProgressView()
            case .loaded(let image):
                image
                    .resizable()
                    .frame(width: 200, height: 200)
            }
        }
        .onAppear {
            viewModel.getCoverArt()
        }
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static let url = URL(string: "https://is5-ssl.mzstatic.com/image/thumb/Music123/v4/2b/4d/97/2b4d97a1-d445-c0f9-6f95-f602392ec362/016861741006.jpg/128x128bb.jpeg")!
    static var previews: some View {
        AlbumDetailView(viewModel: AlbumDetailViewModel(url: Self.url))
    }
}
