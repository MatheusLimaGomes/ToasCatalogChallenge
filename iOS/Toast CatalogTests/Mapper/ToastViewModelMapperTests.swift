//
//  ToastViewModelMapperTests.swift
//  Toast CatalogTests
//
//  Created by Matheus F S L Gomes on 16/06/23.
//

import XCTest
@testable import Toast_Catalog
class ToastViewModelMapperTests: XCTestCase {

    var mapper: ToastViewModelMapper!

    override func setUp() {
        super.setUp()
        mapper = ToastViewModelMapper()
    }

    override func tearDown() {
        mapper = nil
        super.tearDown()
    }

    func testMapItemsToViewModels() {
        // Given
        let items = [
            ToastCatalogItem(name: "Toast 1", price: "5.99", id: 1, currency: "USD", lastSold: "15-06-23, 12:34 PM"),
            ToastCatalogItem(name: "Toast 2", price: "7.99", id: 2, currency: "USD", lastSold: "15-06-23, 12:34 PM")
        ]

        // When
        let viewModels = mapper.mapItemsToViewModels(items)

        // Then
        XCTAssertEqual(viewModels.count, 2)
        XCTAssertEqual(viewModels[0].name, "Toast 1")
        XCTAssertEqual(viewModels[0].priceNormalized, "5.99 $")
        XCTAssertEqual(viewModels[1].name, "Toast 2")
        XCTAssertEqual(viewModels[1].priceNormalized, "7.99 $")
    }

}
