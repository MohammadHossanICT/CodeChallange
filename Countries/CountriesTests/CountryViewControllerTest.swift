//
//  CountryViewControllerTest.swift
//  CountriesTests
//
//  Created by Mohammad  on 31/08/22
//

import XCTest
@testable import Countries
import SnapshotTesting

class CountryViewControllerTest: XCTestCase {
    
    var sut: CountriesViewController!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "CountriesViewController") as! CountriesViewController
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testInitialScreen(){
        assertSnapshot(matching: sut, as: .image)
    }
    
    func test_CountriesViewControllerDefaultState() {
        let viewController = UINavigationController(rootViewController: CountriesViewController())
        verifyViewController(viewController, named: "Default")
    }
    
    private func verifyViewController(_ viewController: UIViewController, named: String) {
        let devices: [String: ViewImageConfig] = ["iPhoneX": .iPhoneX,
                                                  "iPhone8": .iPhone8,
                                                  "iPhoneSE": .iPhoneSe]
        
        let results = devices.map { device in
            verifySnapshot(matching: viewController,
                           as: .image(on: device.value),
                           named: "\(named)-\(device.key)",
                           testName: "CountriesViewController")
        }
        
        results.forEach { XCTAssertNil($0) }
    }
}
