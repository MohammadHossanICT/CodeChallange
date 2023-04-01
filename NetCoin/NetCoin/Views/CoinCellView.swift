/*

  Created by Kwabena Ankamah on 08/12/2022.
  
*/
import SwiftUI
struct CoinCellView: View {
    let coin: NetCoin
    let showHoldingsColumn: Bool
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            if showHoldingsColumn {
                centerColumn
            }
           rightColumn
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
        .font(.subheadline)
    }
}
extension CoinCellView {
    private var leftColumn: some View {
        HStack (spacing: 0) {
            Text("\(coin.marketCapRank ?? 1)")
  
            AsyncImage(url: URL(string: coin.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 20, height: 20)

            VStack(alignment: .leading, spacing: 4){
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2 )
        }
    }
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.toCurrency())
                .bold()
            Text((coin.currentHoldings ?? 0).toCurrency())
        }
        .foregroundColor(Color.theme.accent)
    }
    private var rightColumn: some View {
        VStack(alignment: .trailing, spacing: 4) {
            Text(coin.currentPrice.toCurrency())
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.leading, 4)
            Text(coin.priceChangePercentage24H.toPercentString())
                .font(.caption)
                .padding(.leading, 6)
                .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
        }
        .padding(.leading, 2)
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
