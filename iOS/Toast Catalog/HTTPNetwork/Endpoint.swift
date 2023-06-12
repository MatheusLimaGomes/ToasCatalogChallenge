//
//  Endpoint.swift
//  Toast Catalog
//
//  Created by Matheus F S L Gomes on 12/06/23.
//

import Foundation
protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}
extension Endpoint {
    var scheme: String {
        "https"
    }
    var host: String {
        "my-json-server.typicode.com"
    }
}
