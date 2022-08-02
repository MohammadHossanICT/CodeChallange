//
//  CountriesUITests.swift
//  CountriesUITests
//
//  Created by Mohammad  on 31/08/22
//

import XCTest

class CountriesUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTableViewCellText() {
        
        
        let app = XCUIApplication()
        app.launch()
        
        let firstTableViewCellText =  app.tables.staticTexts["name of country is Åland Islands and population is 28875"].otherElements.containing(.staticText, identifier:"Åland Islands")
        
        XCTAssertTrue(firstTableViewCellText.element.exists)
        
        let secondTableViewCellText =  app.tables.staticTexts["name of country is Åland Islands and population is 28875"].otherElements.containing(.staticText, identifier:"Åland Islands")
                
        XCTAssertTrue(secondTableViewCellText.element.exists)
        
        let thirdTableViewCellText =   app.tables.staticTexts["name of country is Albania and population is 2837743"].otherElements.containing(.staticText, identifier:"Albania")
           
        XCTAssertTrue(thirdTableViewCellText.element.exists)

                                
    }
}
