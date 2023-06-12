import Foundation


protocol ToastCatalogServiceable {
    func getItems()  async -> Result<[ToastCatalogItem], RequestError>
}

class ToastCatalogAdapter: HTTPClient, ToastCatalogServiceable {
    func getItems()  async -> Result<[ToastCatalogItem], RequestError> {
        return await sendRequest(endpoint: ToastCatalogEndpointTypePath.toasts, responseModel: [ToastCatalogItem].self)
    }
}
