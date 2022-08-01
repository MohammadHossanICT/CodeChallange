//
//  FakeCountriesRepository.swift
//  CountriesTest
//
//  Created by Mohammad  on 31/08/22
//

import Foundation
@testable import Countries

class FakeCountriesRepository: CountriesRepository{
    
    var session: URLSession
    var baseURL: String
    var isApiSuccessFull = true
    
    init(session: URLSession, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }
    
    func loadCountries() async throws -> [Country] {
        if isApiSuccessFull {
            return Country.mockedData
        }
        throw APIError.unexpectedResponse
    }
    
    func loadCountryDetails(country: Country) async throws -> Country.Details {
        return Country.Details.mockedData
    }
}
