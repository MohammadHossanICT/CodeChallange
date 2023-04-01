/*
  NetCoinViewModelTest.swift
  NetCoinTests

  Created by Kwabena Ankamah on 08/12/2022.
  
*/
import XCTest
@testable import NetCoin

final class NetCoinViewModelTest: XCTestCase {
    var fakeNetCoinRepository: FakeNetCoinRepository!
    var netCoinViewModel : NetCoinViewModel!
    
    override func setUpWithError() throws {
        fakeNetCoinRepository = FakeNetCoinRepository()
        netCoinViewModel = NetCoinViewModel(repository: fakeNetCoinRepository)
    }
    override func tearDownWithError() throws {
        fakeNetCoinRepository = nil
    }
    
    // when url is incorrect , it will return immediatly , No data in coins array and top moving coins array.
    func test_fetch_coins_when_url_is_incorrect() {
        netCoinViewModel.fetchCoins(urlStr: "")
        XCTAssertEqual(netCoinViewModel.coins.count, 0)
        XCTAssertEqual(netCoinViewModel.topMovingCoins.count, 0)
    }
    
    // when url is correct, should have some data in coins and top moving coins array.
    func test_fetch_coins_when_url_is_correct() {
        
        let expectation = XCTestExpectation(
            description: "Fetching coins"
        )
        netCoinViewModel.fetchCoins(urlStr: "test")
        
        let asyncWaitDuration = 5.0 //
        DispatchQueue.main.asyncAfter(deadline: .now() + asyncWaitDuration) {
            XCTAssertEqual(self.netCoinViewModel.coins.count, 2)
            XCTAssertEqual(self.netCoinViewModel.topMovingCoins.count, 2)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: asyncWaitDuration)
       
    }
    
    func test_fetch_coins_when_url_is_correct_but_api_fails() {
        
        let expectation = XCTestExpectation(
            description: "Fetching coins"
        )
        fakeNetCoinRepository.error = .dataNotFound

        netCoinViewModel.fetchCoins(urlStr: "test")
        
        let asyncWaitDuration = 5.0 //
        DispatchQueue.main.asyncAfter(deadline: .now() + asyncWaitDuration) {
            XCTAssertEqual(self.netCoinViewModel.coins.count, 0)
            XCTAssertEqual(self.netCoinViewModel.topMovingCoins.count, 0)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: asyncWaitDuration)
       
    }
    
    // when search text is empty checking filtered coins array
    func test_search_when_search_text_is_empty() {
        
        let expectation = XCTestExpectation(
            description: "Fetching coins"
        )
        netCoinViewModel.fetchCoins(urlStr: "test")
        netCoinViewModel.searchText = ""
        let asyncWaitDuration = 5.0 //
        DispatchQueue.main.asyncAfter(deadline: .now() + asyncWaitDuration) {
            XCTAssertEqual(self.netCoinViewModel.coins.count, 2)
            XCTAssertEqual(self.netCoinViewModel.topMovingCoins.count, 2)
            
            XCTAssertEqual(self.netCoinViewModel.filteredCoins.count, 2)

            expectation.fulfill()
        }
        wait(for: [expectation], timeout: asyncWaitDuration)
       
    }
    
    // when search text is not empty checking filtered coins array
    func test_search_when_search_text_is_not_empty() {
        
        let expectation = XCTestExpectation(
            description: "Fetching coins"
        )
        netCoinViewModel.fetchCoins(urlStr: "test")
        netCoinViewModel.searchText = "eth"
        let asyncWaitDuration = 5.0 //
        DispatchQueue.main.asyncAfter(deadline: .now() + asyncWaitDuration) {
            XCTAssertEqual(self.netCoinViewModel.coins.count, 2)
            XCTAssertEqual(self.netCoinViewModel.topMovingCoins.count, 2)
            
            XCTAssertEqual(self.netCoinViewModel.filteredCoins.count, 1)

            expectation.fulfill()
        }
        wait(for: [expectation], timeout: asyncWaitDuration)
       
    }

}
