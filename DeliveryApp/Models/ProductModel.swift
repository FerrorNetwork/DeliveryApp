import Foundation

enum New {
    case yes
    case none
}

struct ProductModel {
    let image: String
    let name: String
    let weight: String
    let price: String?
    let salePrice: String?
    let sale: String
    let new: New
}
