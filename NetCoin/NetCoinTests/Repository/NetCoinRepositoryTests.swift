//
//  NetCoinRepositoryTests.swift
//  NetCoinTests
//
//  Created by Kwabena Ankamah on 16/12/2022.
//

import XCTest
@testable import NetCoin

final class NetCoinRepositoryTests: XCTestCase {

    var fakeNetworkManager: FakeNetworkManager!
    var netCoinRepository: NetCoinRepository!
    
    override func setUpWithError() throws {
        fakeNetworkManager = FakeNetworkManager()
        netCoinRepository = NetCoinRepositoryImpl(networkManager: fakeNetworkManager)
    }
    override func tearDownWithError() throws {
        netCoinRepository = nil
    }
    
    // when passes netcoins array will return with some data
    func test_when_get_net_coin_success() async {
        let netCoins = try! await netCoinRepository.getCoins(for: URL(string:"NetCoinResponse")!)
        
        XCTAssertNotNil(netCoins)
        XCTAssertEqual(netCoins.count, 10)
        XCTAssertEqual(netCoins.first?.name,
        "Bitcoin")

    }
    
    // when fails netcoins will be nil
    func test_when_get_net_coin_fails() async {
        let netCoins = try? await netCoinRepository.getCoins(for: URL(string:"NetCoinResponse_failure")!)
        XCTAssertNil(netCoins)
    }
   
}
