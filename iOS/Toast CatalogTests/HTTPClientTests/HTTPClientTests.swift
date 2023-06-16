//
//  HTTPClientTests.swift
//  Toast CatalogTests
//
//  Created by Matheus F S L Gomes on 16/06/23.
//
import XCTest
@testable import Toast_Catalog

class HTTPClientTests: XCTestCase {
    var httpClient: HTTPClient!

    override func setUp() {
        super.setUp()
        httpClient = MockHTTPClient()
    }

    override func tearDown() {
        httpClient = nil
        super.tearDown()
    }

    func testSendRequest_WithValidEndpoint_ReturnsSuccess() {
        let endpoint = MockEndpoint()
        let expectation = XCTestExpectation(description: "Request expectation")

        Task {
            let result: Result<MockResponse, RequestError> = await httpClient.sendRequest(endpoint: endpoint, responseModel: MockResponse.self)
            switch result {
            case .success(let response):
                XCTAssertEqual(response.message, "Success")
            case .failure:
                XCTFail("Unexpected failure")
            }

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func testSendRequest_WithInvalidURL_ReturnsFailure() {
        let endpoint = MockEndpoint(isInvalidURL: true)
        let expectation = XCTestExpectation(description: "Request expectation")

        Task {
            let result: Result<MockResponse, RequestError> = await httpClient.sendRequest(endpoint: endpoint, responseModel: MockResponse.self)
            switch result {
            case .success:
                XCTFail("Unexpected success")
            case .failure(let error):
                XCTAssertEqual(error, .invalidURL)
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func testSendRequest_WithUnauthorized_ReturnsFailure() {
        let endpoint = MockEndpoint(statusCode: 401)
        let expectation = XCTestExpectation(description: "Request expectation")

        Task {
            let result: Result<MockResponse, RequestError> = await httpClient.sendRequest(endpoint: endpoint, responseModel: MockResponse.self)
            switch result {
            case .success:
                XCTFail("Unexpected success")
            case .failure(let error):
                XCTAssertEqual(error, .unauthorized)
            }

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func testSendRequest_WithServerError_ReturnsFailure() {
        let endpoint = MockEndpoint(statusCode: 500)
        let expectation = XCTestExpectation(description: "Request expectation")

        Task {
            let result: Result<MockResponse, RequestError> = await httpClient.sendRequest(endpoint: endpoint, responseModel: MockResponse.self)
            switch result {
            case .success:
                XCTFail("Unexpected success")
            case .failure(let error):
                XCTAssertEqual(error, .serverError)
            }

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
