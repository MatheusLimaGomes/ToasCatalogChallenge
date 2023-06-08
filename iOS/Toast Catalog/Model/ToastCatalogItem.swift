import Foundation

struct ToastCatalogItem: Identifiable, Hashable, Codable {
    let name: String
    let price: String
    let id: Int
    let currency: String
    let lastSold: String
    private enum CodingKeys: String, CodingKey {
        case name
        case price
        case id
        case currency
        case lastSold = "last_sold"
    }
}
