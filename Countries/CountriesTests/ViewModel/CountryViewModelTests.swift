//
//  SearchViewModelTests.swift
//  CountriesTests
//
//  Created by Mohammad  on 31/08/22
//

import XCTest
@testable import Countries

class CountryViewModelTests: XCTestCase {

    var viewModel:CountryViewModel!
    let countriesRepository = FakeCountriesRepository(session: URLSession.shared, baseURL: EndPoint.baseUrl)

    override func setUpWithError() throws {
        viewModel = CountryViewModel(countryRepository: countriesRepository)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    // when get countries api call is successfull
    func testGetCountriesAPISuccessfull() async {
    
        await viewModel.getCountires()
        XCTAssertEqual(viewModel.state, .showCountryList)
        XCTAssertEqual(viewModel.countryRecordsCount, 3)
    }
    
    // when get specific country after get countries api call is successfull
    func testGetCountryWhenAPISuccessfull() async {
    
        await viewModel.getCountires()
       
        let country = viewModel.getCountry(index: 0)
        
        XCTAssertEqual(country.name, "United States")
        XCTAssertEqual(country.population, 125000000)

    }
    
    
    // when get countries api call is successfull
    func testGetCountriesAPIFailed() async {
    
        countriesRepository.isApiSuccessFull = false
        
        await viewModel.getCountires()
        XCTAssertEqual(viewModel.state, .showError("Unexpected response from the server"))
        XCTAssertEqual(viewModel.countryRecordsCount, 0)
    }
}
