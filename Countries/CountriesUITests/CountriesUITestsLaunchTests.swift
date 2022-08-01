//
//  CountriesUITestsLaunchTests.swift
//  CountriesUITests
//
//  Created by MAC on 01/08/22.
//

import XCTest

class CountriesUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    func test_snapshot(){
        
        let app = XCUIApplication()
        app.activate()
        
        let tablesQuery = XCUIApplication().tables
        tablesQuery.staticTexts["name of country is Åland Islands and population is 28875"].otherElements.containing(.staticText, identifier:"Åland Islands").element.tap()
        
        XCTAssertTrue(tablesQuery.element.exists)
        
        tablesQuery.staticTexts["name of country is Albania and population is 2837743"].otherElements.containing(.staticText, identifier:"Albania").element.tap()
        
        XCTAssertTrue(tablesQuery.element.exists)
        
        XCUIApplication().tables.staticTexts["name of country is Andorra and population is 77265"].otherElements.containing(.staticText, identifier:"Andorra").element.tap()
                
        XCTAssertTrue(tablesQuery.element.exists)
    }

}
