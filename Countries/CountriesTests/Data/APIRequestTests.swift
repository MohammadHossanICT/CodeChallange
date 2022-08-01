//
//  APIRequestTests.swift
//  CountriesTests
//
//  Created by Mohammad  on 31/08/22
//

import XCTest
@testable import Countries

class APIRequestTests: XCTestCase {

    // invalid url when base url is empty
    func testURLRequestBadURL() {
        do {
          let _ =  try  RealCountriesRepository.API.allCountries.urlRequest(baseURL: "")

        }catch {
            XCTAssertEqual(error as! APIError, APIError.invalidURL)
        }

    }
    
    // valid request when base url right
    func testURLRequestGoodURl() {
          let request =  try?  RealCountriesRepository.API.allCountries.urlRequest(baseURL: "www.test.com")

        XCTAssertNotNil(request)
    }

}
