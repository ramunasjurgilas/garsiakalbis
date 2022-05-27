//
//  File.swift
//  
//
//  Created by Ramūnas Jurgilas on 2022-05-27.
//

import Foundation
import Combine
import SwiftUI

public struct GetCoverArtDetail: Endpoint {
    enum DetailError: Error {
        case canNotCreateImage
    }
    var urlSession: URLSession
    
    var path: EndpointPath
    
    var url: URL
    
    var httpMethod: String
    
    func httpBody() throws -> Data? {
        nil
    }
    
    public init(urlSession: URLSession = .shared, url: URL) {
        self.urlSession = urlSession
        self.url = url
        self.httpMethod = "GET"
        self.path = .base
    }
    
    public func exe() -> AnyPublisher<Result<Image, Error>, Never> {
        download()
            .map { result in
                switch result {
                case .success(let data):
                    guard let image = UIImage(data: data) else { return Result.failure(DetailError.canNotCreateImage)}
                    return Result.success(Image(uiImage: image))
                case .failure(let error):
                    return Result.failure(error)
                }
            }
            .eraseToAnyPublisher()
    }
}
