//
//  FakeNetCoinRepository.swift
//  NetCoinTests
//
//  Created by Kwabena Ankamah on 16/12/2022.
//

import Foundation
@testable import NetCoin

class FakeNetCoinRepository: NetCoinRepository {
    
    var error: NetworkError?
    func getCoins(for url: URL) async throws -> [NetCoin] {
        guard error == nil else { throw error! }
        return NetCoin.mockData()
    }
    
}

extension NetCoin {
    static func mockData() -> [NetCoin] {
       return [ NetCoin(id: "ethereum", symbol: "eth", name: "Ethereum", image:"https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice:17225.59, marketCapRank: 1, high24H: 17309.57, low24H: 16822.19, priceChange24H: 387.55, priceChangePercentage24H: 2.30161, priceChangePercentage24HInCurrency: 8134202928, currentHoldings: 2.51197),
           NetCoin(id: "bitcoin", symbol: "btc", name: "Bitcoin", image:"https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice:17225.59, marketCapRank: 1, high24H: 17309.57, low24H: 16822.19, priceChange24H: 387.55, priceChangePercentage24H: 2.30161, priceChangePercentage24HInCurrency: 8134202928, currentHoldings: 2.51197)]
    }
}
