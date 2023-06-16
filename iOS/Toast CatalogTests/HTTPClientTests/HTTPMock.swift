//
//  HTTPMock.swift
//  Toast CatalogTests
//
//  Created by Matheus F S L Gomes on 16/06/23.
//

import Foundation
@testable import Toast_Catalog
struct MockResponse: Decodable {
    let message: String
}

final class MockHTTPClient: HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError> {
        if let endpoint = endpoint as? MockEndpoint {
            if endpoint.isInvalidURL {
                return .failure(.invalidURL)
            } else if endpoint.statusCode == 200 {
                let mockResponse = MockResponse(message: "Success")
                return .success(mockResponse as! T)
            } else if endpoint.statusCode == 401 {
                return .failure(.unauthorized)
            } else if endpoint.statusCode >= 400 && endpoint.statusCode <= 505 {
                return .failure(.serverError)
            }
        }
        
        return .failure(.unknown)
    }
}

struct MockEndpoint: Endpoint {
    let isInvalidURL: Bool
    let statusCode: Int
    
    init(isInvalidURL: Bool = false, statusCode: Int = 200) {
        self.isInvalidURL = isInvalidURL
        self.statusCode = statusCode
    }
    
    var path: String { return "/endpoint" }
    var method: RequestMethod { return .get }
    var header: [String: String]? { return nil }
    var body: [String: String]? { return nil }
}
