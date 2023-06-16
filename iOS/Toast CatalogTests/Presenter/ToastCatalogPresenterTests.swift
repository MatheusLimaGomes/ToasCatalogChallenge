//
//  ToastCatalogPresenterTests.swift
//  Toast CatalogTests
//
//  Created by Matheus F S L Gomes on 16/06/23.
//
import XCTest
@testable import Toast_Catalog

class ToastCatalogPresenterTests: XCTestCase {

    var presenter: ToastCatalogPresenter!
    var service: MockToastCatalogService!
    var viewModelMapper: ToastViewModelMapper!

    override func setUp() {
        super.setUp()
        service = MockToastCatalogService()
        viewModelMapper = ToastViewModelMapper()
        presenter = ToastCatalogPresenter(service: service, viewModelMapper: viewModelMapper)
    }

    override func tearDown() {
        presenter = nil
        service = nil
        viewModelMapper = nil
        super.tearDown()
    }

    func testGetItems_Success() {
        // Given
        let items = [ToastCatalogItem(name: "Toast 1", price: "5.99", id: 1, currency: "USD", lastSold: "15-06-23, 12:34 PM")]
        service.result = .success(items)

        // When
        let expectation = self.expectation(description: "Items retrieval")
        presenter.getItems { result in
            switch result {
            case .success:
                // Then
                XCTAssertEqual(self.presenter.toastItemViewModel?.count, 1)
                XCTAssertEqual(self.presenter.toastItemViewModel?.first?.name, "Toast 1")
                expectation.fulfill()
            case .failure:
                XCTFail("Expected successful retrieval")
            }
        }

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGetItems_Failure() {
        // Given
        service.result = .failure(.unknown)

        // When
        let expectation = self.expectation(description: "Items retrieval")
        presenter.getItems { result in
            switch result {
            case .success:
                XCTFail("Expected retrieval failure")
            case .failure(let error):
                // Then
                XCTAssertEqual(error, .unknown)
                XCTAssertNil(self.presenter.toastItemViewModel)
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 1.0, handler: nil)
    }

}


