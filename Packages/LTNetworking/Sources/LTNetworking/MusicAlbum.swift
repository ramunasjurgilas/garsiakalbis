//
//  File.swift
//  
//
//  Created by Ramūnas Jurgilas on 2022-05-27.
//

import Foundation

public struct MusicAlbum: Decodable {
    public let album: String
    public let artist: String
    public let cover: URL
    public let id: String
    
    public init(
        album: String,
        artist: String,
        cover: URL,
        id: String
    ) {
        self.album = album
        self.artist = artist
        self.cover = cover
        self.id = id
    }
}

