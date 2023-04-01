/*

  Created by Kwabena Ankamah on 08/12/2022.
  
*/
import SwiftUI
struct TopMoversItemView: View {
    let coin: NetCoin
    private let cornerRadius: CGFloat = 12
    var body: some View {
        VStack(alignment: .leading) {
            //image
            AsyncImage(url: URL(string: coin.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
                .frame(width: 32, height: 32)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .foregroundColor(.orange)
                .padding(.bottom, 8)
            //coin info
            HStack{
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                
                Text(coin.currentPrice.toCurrency()).fontWeight(.bold)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            //coin percentage change
            Text(coin.priceChangePercentage24H.toPercentString())
                .font(.title2)
                .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
        }
        .frame(width: 140, height: 140)
        .background(Color("ItemBackgroundColor"))
        .overlay(
        RoundedRectangle(cornerRadius: 10)
            .stroke(Color(.systemGray4),lineWidth: 2
                   ))
    }
}

