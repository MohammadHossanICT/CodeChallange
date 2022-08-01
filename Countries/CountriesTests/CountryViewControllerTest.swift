//
//  CountryViewControllerTest.swift
//  CountriesTests
//
//  Created by M A Hossan on 01/08/2022.
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
}
