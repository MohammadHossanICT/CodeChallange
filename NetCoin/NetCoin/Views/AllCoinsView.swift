/*
 
  Created by Kwabena Ankamah on 08/12/2022.
  
*/
import SwiftUI
struct AllCoinsView: View {
    @StateObject var netCoinViewModel: NetCoinViewModel
    @Binding var showPortfolio: Bool
    var body: some View {
        VStack(alignment: .leading){
            Text("All Coins")
                .font(.headline)
                .padding()
            columnTitles
                VStack {
                    List {
                        //possible if statement here
                        ForEach(netCoinViewModel.filteredCoins) { coin in
                            CoinCellView(coin: coin, showHoldingsColumn: showPortfolio)
                                .listRowInsets(.init(top: 10, leading: -0.10, bottom: 10, trailing: 0))
                        }
                    }
            }
        }
    }
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            if showPortfolio{
                Text("Holdings")
            }
            Text("Prices")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.horizontal)
    }
}

