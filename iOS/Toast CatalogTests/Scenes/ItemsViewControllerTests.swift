//
//  ItemsViewControllerTests.swift
//  Toast CatalogTests
//
//  Created by Matheus F S L Gomes on 16/06/23.
//

import XCTest
@testable import Toast_Catalog

class ItemsViewControllerTests: XCTestCase {

    var sut: ItemsViewController!
    var presenter: MockToastCatalogPresenter!

    override func setUp() {
        super.setUp()
        presenter = MockToastCatalogPresenter()
        sut = ItemsViewController(presenter: presenter)
        _ = sut.view
    }

    override func tearDown() {
        sut = nil
        presenter = nil
        super.tearDown()
    }

    func testLoadTableView_Success() {
        // Given
        let items = [
            ToastItemViewModel(name: "Toast 1", price: "5.99", id: 1, currency: "USD", lastSold: ""),
            ToastItemViewModel(name: "Toast 2", price: "7.99", id: 2, currency: "USD", lastSold: "")
        ]
        presenter.result = .success(items)

        // When
        sut.loadTableView()

        // Then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2)
    }

    class MockToastCatalogPresenter: ToastCatalogPresenterProtocol {
        var toastItemViewModel: [ToastItemViewModelProtocol]?
        var cellID: String = "CustomTableViewCell"
        var service: ToastCatalogServiceable = MockToastCatalogService()

        var result: Result<[ToastItemViewModel], RequestError>?

        func getItems(completion: @escaping (Result<Void, RequestError>) -> Void) {
            if let result = result {
                switch result {
                case .success(let viewModels):
                    var convertedViewModels: [ToastItemViewModelProtocol] = []
                    for viewModel in viewModels {
                        convertedViewModels.append(viewModel)
                    }
                    toastItemViewModel = convertedViewModels
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(error))
                }
            } else {
                completion(.failure(.unknown))
            }
        }
    }
}
