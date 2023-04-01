
import Foundation
@testable import NetCoin




import Foundation
@testable import NetCoin

class FakeNetworkManager: NetworkActions {
    func get(url: URL) async throws -> Data {
        do {
            let bundle = Bundle(for: FakeNetworkManager.self)
            guard let path =  bundle.url(forResource:url.absoluteString, withExtension: "json") else {
                throw NetworkError.invalidUrl
            }
            let data = try Data(contentsOf: path)
            return data
        } catch {
            throw NetworkError.dataNotFound
        }
    }
}
