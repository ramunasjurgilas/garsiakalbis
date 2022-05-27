//
//  File.swift
//  
//
//  Created by Ramūnas Jurgilas on 2022-05-27.
//

import Foundation
import Combine

enum EndpointPath: String {
    case musicAlbums = "/music-albums.json"
    case coreArtUrl = "/cover-art-url"
    
    func url() -> URL {
        #warning("This url must be retrieved from preference file or injected from the main app module.")
        let url = "https://1979673067.rsc.cdn77.org"
        var components = URLComponents(string: url)
        components!.path.append(self.rawValue)
        
        return components!.url!
    }
}

extension Endpoint {
    func reqeust() -> URLRequest {
        var result = URLRequest(url: url)
        result.httpMethod = httpMethod
        
        return result
    }
    
    func exe<T>(type: T.Type) -> AnyPublisher<T, Error> where T: Decodable {
        urlSession
            .dataTaskPublisher(for: reqeust())
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
