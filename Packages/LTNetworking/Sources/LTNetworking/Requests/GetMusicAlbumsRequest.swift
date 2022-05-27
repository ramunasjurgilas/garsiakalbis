//
//  File.swift
//  
//
//  Created by Ramūnas Jurgilas on 2022-05-27.
//

import Foundation
import Combine

struct GetMusicAlbumsRequest: Endpoint {
    var url: URL { path.url() }
    
    var httpMethod: String = "GET"
    var urlSession: URLSession
    var path: EndpointPath = .musicAlbums
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func httpBody() throws -> Data? {
        nil
    }
    
    func exe() -> AnyPublisher<Result<[MusicAlbum], Error>, Never> {
        exe(type: [MusicAlbum].self)
            .eraseToAnyPublisher()
    }
}
