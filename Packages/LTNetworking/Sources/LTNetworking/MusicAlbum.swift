//
//  File.swift
//  
//
//  Created by Ramūnas Jurgilas on 2022-05-27.
//

import Foundation

struct MusicAlbum: Decodable {
    let album: String
    let artist: String
    let cover: URL
}
