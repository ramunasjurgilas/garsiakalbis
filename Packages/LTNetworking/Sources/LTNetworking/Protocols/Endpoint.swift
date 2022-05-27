//
//  File.swift
//  
//
//  Created by Ramūnas Jurgilas on 2022-05-27.
//

import Foundation

protocol Endpoint {
    var urlSession: URLSession { get }
    var tenant: String? { get }
    var path: EndpointPath { get }
    
    var url: URL { get }
    var httpMethod: String { get }
    func httpBody() throws -> Data?
}
