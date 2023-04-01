/*

  Created by Kwabena Ankamah on 08/12/2022.
  
*/

import SwiftUI

@main
struct NetCoinApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView(netCoinViewModel: NetCoinViewModel(repository: NetCoinRepositoryImpl(networkManager: NetworkManager())))
                    .navigationBarHidden(true)
            }
            
        }
    }
}
