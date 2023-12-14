import Foundation

struct AddressModelResponse : Decodable {
    let suggestions : [AddressModel]?
}

struct AddressModel : Decodable {
    let value : String?
    let unrestrictedValue : String?
    
    enum CodingKeys: String, CodingKey {
        case value
        case unrestrictedValue = "unrestricted_value"
    }
}
