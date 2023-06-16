//
//  MockToastCatalogService.swift
//  Toast CatalogTests
//
//  Created by Matheus F S L Gomes on 16/06/23.
//

import Foundation
@testable import Toast_Catalog

class MockToastCatalogService: ToastCatalogServiceable {

    var result: Result<[ToastCatalogItem], RequestError>?

    func getItems() async -> Result<[ToastCatalogItem], RequestError> {
        if let result = result {
            return result
        } else {
            return .failure(.unknown)
        }
    }

}
