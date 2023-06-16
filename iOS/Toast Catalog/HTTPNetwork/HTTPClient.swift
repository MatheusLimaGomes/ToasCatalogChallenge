//
//  HTTPClient.swift
//  Toast Catalog
//
//  Created by Matheus F S L Gomes on 12/06/23.
//

import Foundation
protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError>
}
extension HTTPClient {
    fileprivate func configureURLRequest(to url: URL, from endpoint: Endpoint) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        return request
    }
    
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError> {
        guard let url = buildURL(from: endpoint) else {
            return .failure(.invalidURL)
        }
        let request = configureURLRequest(to: url, from: endpoint)
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else { return .failure(.noResponse) }
            switch response.statusCode {
            case 200...299:
                let jsonDecoder = JSONDecoder()
                guard let  decodeResponse = try? jsonDecoder.decode(responseModel, from: data) else {
                    return .failure(.decode)
                }
                return .success(decodeResponse)
            case 401: return .failure(.unauthorized)
            case 400...505: return .failure(.serverError)
            default:
                return .failure(.unknown)
            }
        } catch {
            return .failure(.unknown)
        }
        
    }
    private func buildURL(from endpoint: Endpoint) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        return urlComponents.url
    }
}
