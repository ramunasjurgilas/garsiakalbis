//
//  MusicAlbumsListView.swift
//  Lautsprecher
//
//  Created by Ramūnas Jurgilas on 2022-05-27.
//

import SwiftUI
import LTNetworking

struct MusicAlbumsListView: View {
    let musicAlbums: [MusicAlbum]
    
    var body: some View {
        List(musicAlbums, id: \.self) { album in
            NavigationLink {
                Text("dsd")
            } label: {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Artist: ")
                        Text(album.artist)
                    }
                    .font(.headline)
                    HStack {
                        Text("Album: ")
                        Text(album.album)
                        .font(.subheadline) }
                }
            }
        }
    }
}
struct MusicAlbumsListView_Previews: PreviewProvider {
    static var previews: some View {
        MusicAlbumsListView(musicAlbums: mockAlbums)
    }
}

let url = URL(string: "https://is5-ssl.mzstatic.com/image/thumb/Music123/v4/2b/4d/97/2b4d97a1-d445-c0f9-6f95-f602392ec362/016861741006.jpg/128x128bb.jpeg")!
let mockAlbums: [MusicAlbum] = [MusicAlbum(album: "Frozen", artist: "Madona", cover: url, id: "1234"),
                                MusicAlbum(album: "Best", artist: "Taylor Swift", cover: url, id: "1235")]

