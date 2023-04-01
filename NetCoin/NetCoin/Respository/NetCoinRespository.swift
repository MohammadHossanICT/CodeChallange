/*
 
  Created by Kwabena Ankamah on 08/12/2022.
  
*/
import Foundation
import Combine

protocol NetCoinRepository {
    func getCoins(for url: URL) async throws -> [NetCoin]
}
struct NetCoinRepositoryImpl {
    private let networkManager: NetworkActions
    private var cancellables = Set<AnyCancellable>()
    init(networkManager: NetworkActions) {
        self.networkManager = networkManager
    }
}
extension NetCoinRepositoryImpl: NetCoinRepository {
    func getCoins(for url: URL) async throws -> [NetCoin] {
        let netCoinsData =  try await networkManager.get(url: url)
        let netCoins = try JSONDecoder().decode([NetCoin].self, from: netCoinsData )
        return netCoins
    }
}
