//
//  MusicAlbumsScreen.swift
//  Lautsprecher
//
//  Created by Ramūnas Jurgilas on 2022-05-27.
//

import SwiftUI

struct MusicAlbumsScreen: View {
    @StateObject var viewModel: MusicAlbumsViewModel
    
    var body: some View {
        Group {
            switch viewModel.viewState {
            case .error(let error):
                VStack {
                    Image(systemName: "xmark.octagon")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text(error.localizedDescription)
                }
            case .loading:
                ProgressView()
            case .loaded(let musicAlbums):
                MusicAlbumsListView(musicAlbums: musicAlbums)
                    .navigationTitle("title-music-albums")
                    .toolbar(content: {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                #warning("Implement add album.")
                            } label: {
                                Image(systemName: "plus")
                            }
                        }
                    })
                    .embedInNavigationView()
            }
        }
        .onAppear {
            viewModel.fetchMusicAlbums()
        }
    }
}

struct MusicAlbums_Previews: PreviewProvider {
    static var previews: some View {
        MusicAlbumsScreen(viewModel: MusicAlbumsViewModel(viewState: .loading))
    }
}
