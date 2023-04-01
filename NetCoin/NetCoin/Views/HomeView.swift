/*


  Created by Kwabena Ankamah on 08/12/2022.
  
*/
import SwiftUI

struct HomeView: View {
    @StateObject var netCoinViewModel:  NetCoinViewModel
    @State private var showPortfolio: Bool = false
    var body: some View {
        VStack {
            homeHeader
            if !showPortfolio {
                Spacer(minLength: 0)
                TopMoversView(netCoinViewModel: netCoinViewModel)
                    .transition(.move(edge: .leading))
                Divider()
                SearchCoinsView(searchText:  $netCoinViewModel.searchText)
                AllCoinsView(netCoinViewModel: netCoinViewModel, showPortfolio: $showPortfolio)
                    .listStyle(PlainListStyle())
                    .transition(.move(edge: .leading))
            }
            if showPortfolio {
                AllCoinsView(netCoinViewModel: netCoinViewModel, showPortfolio: $showPortfolio)
                    .listStyle(PlainListStyle())
                    .transition(.move(edge: .trailing))
            }
            Spacer(minLength: 0)
        }
        .onAppear{
            netCoinViewModel.fetchCoins(urlStr: Endpoint.coinUrlStr )
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(netCoinViewModel: NetCoinViewModel(repository: NetCoinRepositoryImpl(networkManager: NetworkManager())))
    }
}
extension HomeView {
    private var homeHeader: some View {
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus" : "person.fill")
                .animation(.none)
                .background(CircleButtonAnimationVIew(animate: $showPortfolio))
            Spacer()
            Text(showPortfolio ? "Net Coin Portfolio" : "Net Coin Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()){
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}
