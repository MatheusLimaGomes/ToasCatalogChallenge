//
//  ToastCatalogEndpoint.swift
//  Toast Catalog
//
//  Created by Matheus F S L Gomes on 12/06/23.
//

import Foundation
enum ToastCatalogEndpointTypePath {
    case toasts
}

extension ToastCatalogEndpointTypePath: Endpoint {
    var path: String {
        switch self {
        case .toasts:
            return "/sumup-challenges/mobile-coding-challenge-data/items/"
        }
    }
    var method: RequestMethod {
        switch self {
        case .toasts: return .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .toasts: return nil
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .toasts: return nil
        }
    }
}

