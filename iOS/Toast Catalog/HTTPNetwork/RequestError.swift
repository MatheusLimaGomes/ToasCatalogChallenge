//
//  RequestError.swift
//  Toast Catalog
//
//  Created by Matheus F S L Gomes on 12/06/23.
//

import Foundation
enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case serverError
    case unexpectedStatusCode
    case unknown
    
    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        case .serverError:
            return "Sorry!! We're in trouble right now, but we're working on fixing it. Try later"
        default:
            return "Unknown Error"
        }
    }
}
