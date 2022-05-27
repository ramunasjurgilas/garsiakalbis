//
//  File.swift
//  
//
//  Created by Ramūnas Jurgilas on 2022-05-27.
//

import Foundation
import Combine

enum EndpointPath: String {
    case base = "/"
    case musicAlbums = "/music-albums.json"
    
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
    
    func exe<T>(type: T.Type) -> AnyPublisher<Result<T, Error>, Never> where T: Decodable {
        urlSession
            .dataTaskPublisher(for: reqeust())
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .map({ d in
                Result.success(d)
            })
            .catch({ error in
                Just(.failure(error))
            })
            .print()
            .eraseToAnyPublisher()
    }
    
    func download() -> AnyPublisher<Result<Data, Error>, Never> {
        urlSession
            .dataTaskPublisher(for: url)
            .map(\.data)
            .map { Result.success($0) }
            .catch( { error in
                Just(.failure(error))
            })
                .eraseToAnyPublisher()
    }
}

extension Publisher {
  func asResult() -> AnyPublisher<Result<Output, Failure>, Never> {
    self
      .map(Result.success)
      .catch { error in
        Just(.failure(error))
      }
      .eraseToAnyPublisher()
  }
}
