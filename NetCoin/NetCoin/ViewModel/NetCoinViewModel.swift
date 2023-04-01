/*

  Created by Kwabena Ankamah on 08/12/2022.
  
*/

import Foundation
import Combine
protocol NetCoinViewModelAction: ObservableObject {
    func fetchCoins(urlStr: String)
}
final class NetCoinViewModel {
    var coins: [NetCoin] = []
    @Published private(set) var filteredCoins: [NetCoin] = []
    @Published var searchText: String = ""
    private let repository: NetCoinRepository
    private var cancellables = Set<AnyCancellable>()
    var topMovingCoins: [NetCoin]  {
        let topMovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
        return Array(topMovers.prefix(8))
    }
    init(repository: NetCoinRepository) {
        self.repository = repository
    }
}
extension NetCoinViewModel: NetCoinViewModelAction {
    func fetchCoins(urlStr: String) {
        guard let url = URL(string: urlStr) else {
            return
        }
        Task {
            do {
                let netCoins = try await repository.getCoins(for: url)
                dataToPublisher(netCoins: netCoins)
            }catch {
                dataToPublisher(netCoins: [])
            }
        }
    }
}
extension NetCoinViewModel {
    private func dataToPublisher(netCoins: [NetCoin]) {
         DispatchQueue.main.async {
             self.coins = netCoins
             self.filteredCoins = netCoins
             self.addCoinsSubscribers(searchText: self.searchText)
         }
     }
     private func addCoinsSubscribers(searchText: String) {
         $searchText
             .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
             .map {
                 guard !$0.isEmpty else {
                     return self.coins
                 }
                 let lowercasedText = $0.lowercased()
                 return self.coins.filter{
                      $0.name.lowercased().contains(lowercasedText) ||
                      $0.symbol.lowercased().contains(lowercasedText) ||
                      $0.id.lowercased().contains(lowercasedText)
                 }
             }
             .assign(to: \.filteredCoins, on: self)
             .store(in: &cancellables)
     }
}
    
