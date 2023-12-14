import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()

    private let apiKey = "a7fda5a41a8f318e425906474c7b83644cc05adc"
    
    func searchAdressRequest(
        query: String,
        onCompletion: @escaping ((Result <AddressModelResponse, Error>) -> Void)
    ) {
        guard let url = createURLcomponents() else {
            return
        }

        let userData = ["query": query]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        guard let httpBody = try? JSONSerialization.data(withJSONObject: userData, options: []) else { return }
        request.httpBody = httpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Token \(apiKey)", forHTTPHeaderField: "Authorization")

        AF.request(request).response { response in
            switch response.result {
            case .success(let data):
                if let data = data {
                    do {
                        if let result = try self.randomPhotoParseJSON(withData: data) {
                            onCompletion(.success(result))
                        }
                    } catch {
                        onCompletion(.failure(error))
                    }
                }
            case .failure(let error):
                print(error)
                onCompletion(.failure(error))
            }
        }
    }

    private func createURLcomponents() -> URL? {
        var urlComponents = URLComponents()

        urlComponents.scheme = "https"
        urlComponents.host = "suggestions.dadata.ru"
        
        urlComponents.path = "/suggestions/api/4_1/rs/suggest/address"
        return urlComponents.url
    }

    private func randomPhotoParseJSON(withData data: Data) throws -> AddressModelResponse? {
        let decoder = JSONDecoder()
        let photoData = try decoder.decode(AddressModelResponse.self, from: data)
        return photoData
    }
}
