//
//  ToastCatalogService.swift
//  Toast Catalog
//
//  Created by Matheus F S L Gomes on 02/06/23.
//

import Foundation

protocol ToastCatalogServiceable {
    func getToastCatalog() async -> Result<[ToastCatalogItem], RequestError>
}
struct ToastCatalogService: HTTPClient, ToastCatalogServiceable {
    func getToastCatalog() async -> Result<[ToastCatalogItem], RequestError> {
        return await sendRequest(endpoint: ToastCatalogEndpoint.toasts, responseModel: [ToastCatalogItem].self)
    }
}
