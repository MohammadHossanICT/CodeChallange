//
//  CountriesRepositoryTests.swift
//  CountriesTests
//
//  Created by Mohammad  on 31/08/22
//

import XCTest
@testable import Countries


class CountriesRepositoryTests: XCTestCase {
    
    private var  sut: RealCountriesRepository!
    
    typealias API = RealCountriesRepository.API
    typealias Mock = RequestMocking.MockedResponse
    
    override func setUp() {
        sut = RealCountriesRepository(session: .mockedResponsesOnly,
                                      baseURL: "https://test.com")
    }
    
    override func tearDownWithError() throws {
        RequestMocking.removeAllMocks()
    }
    
    
    // Get all countries success
    func test_allCountries() async {
        let data = Country.mockedCountriesJsonData
        
        do {
            try mock(.allCountries, result: .success(data))
            let countries =  try await sut.loadCountries()
            XCTAssertEqual(countries.count, 7)
        }catch {
        }
    }
    
    // Get all countries empty resonse
    func test_allCountriesEmpty() async {
        let data = Country.mockedCountriesEmptyData
        
        do {
            try mock(.allCountries, result: .success(data))
            let countries =  try await sut.loadCountries()
            XCTAssertEqual(countries.count, 0)
        }catch {
        }
    }
    
    // Get all countries parsing Failed
    func test_allCountries_parsingFailed()
    async {
        let data = Country.mockedCountriesJsonData
        
        do {
            try mock(.allCountries, result: .success(data))
            let _ =  try await sut.loadCountries()
        }catch {
            XCTAssertEqual(error as! APIError, APIError.unexpectedResponse)
        }
    }
    
    // Get all countries Invalid URL
    func test_allCountries_invalidURL() async {
    
    sut = RealCountriesRepository(session: .mockedResponsesOnly,
                                     baseURL: "")
        let data = Country.mockedCountriesJsonData
        
        do {
            try mock(.allCountries, result: .success(data))
            let _ =  try await sut.loadCountries()
        }catch {
            XCTAssertEqual(error as! APIError, APIError.invalidURL)
        }
        
    }
    

    
    // MARK: - Helper
    
    private func mock(_ apiCall: API, result: Result<Data, Swift.Error>,
                      httpCode: HTTPCode = 200) throws {
        let mock = try Mock(apiCall: apiCall, baseURL: sut.baseURL, result: result, httpCode: httpCode)
        RequestMocking.add(mock: mock)
    }
    
}
