//
//  MusicAlbum+extension.swift
//  Lautsprecher
//
//  Created by Ramūnas Jurgilas on 2022-05-27.
//

import LTNetworking

extension MusicAlbum: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: MusicAlbum, rhs: MusicAlbum) -> Bool {
        lhs.id == rhs.id
    }
}
