import XCTest
@testable import Toast_Catalog

class NetworkClientTests: XCTestCase {

    func testEndpoint() async {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let expectedResponse = try! jsonDecoder.decode([ToastCatalogItem].self, from: expectedResponseData)

        let networkClient = ToastCatalogAdapterSpy()
        let result = await networkClient.getItems()
        let items = try? result.get()
        XCTAssertEqual(expectedResponse, items)
        }

}
class ToastCatalogAdapterSpy: ToastCatalogServiceable {
    func getItems() async -> Result<[Toast_Catalog.ToastCatalogItem], Toast_Catalog.RequestError> {
        return .success([
            ToastCatalogItem(name: "Avocado Toast", price: "5.99", id: 1),
            ToastCatalogItem(name: "Bacon Toast", price: "1.99", id: 2),
            ToastCatalogItem(name: "Crunchy Toast", price: "0.99", id: 3)
                        ])
    }
}

private let expectedResponseData = """
[{
    "name": "Avocado Toast",
    "price": "5.99",
    "id": 1,
    "currency": "EUR",
    "last_sold": "2020-11-28T15:14:22Z"
  },
  {
    "name": "Bacon Toast",
    "id": 2,
    "price": "1.99",
    "currency": "EUR",
    "last_sold": "2021-01-30T02:24:04Z"
  },
  {
    "name": "Crunchy Toast",
    "id": 3,
    "price": "0.99",
    "currency": "EUR",
    "last_sold": "2021-03-17T03:45:47Z"
  }
]
""".data(using: .utf8)!

