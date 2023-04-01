/*


  Created by Kwabena Ankamah on 08/12/2022.
  
*/
import SwiftUI
struct TopMoversView: View {
    @StateObject var netCoinViewModel: NetCoinViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Movers")
                .font(.headline)
            ScrollView(.horizontal){
                HStack(spacing: 16 ){
                    ForEach(netCoinViewModel.topMovingCoins){ coin in
                        TopMoversItemView(coin: coin)
                    }
                }
            }
        }
        .padding()
    }
}

