//
//  CountriesRepository.swift
//  Countries
//
//  Created by Mohammad  on 31/08/22
//

import Foundation


protocol CountriesRepository: WebRepository {
    func loadCountries() async throws -> [Country]
//    func loadCountryDetails(country: Country) async throws -> Country.Details
}

struct RealCountriesRepository: CountriesRepository {
    
    let session: URLSession
    let baseURL: String
    
    init(session: URLSession, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }
    
    func loadCountries() async throws -> [Country] {
        
        guard let request = try? API.allCountries.urlRequest(baseURL: baseURL) else {
            throw APIError.invalidURL
        }
        
        guard let data = try? await  call(request: request) else {
            throw APIError.unexpectedResponse
        }

        guard let countries = getDecodedCountriesResopnse(from: data) else {
            throw APIError.unexpectedResponse
        }
    
        return countries
    }
    
//    func loadCountryDetails(country: Country) async throws -> Country.Details {
//
//        guard let data = try? await  call(endpoint: API.countryDetails(country)) else {
//            throw APIError.unexpectedResponse
//        }
//
//        guard let countryDetails = getDecodedCountryDetailsResopnse(from: data) else {
//            throw APIError.unexpectedResponse
//        }
//
//        return countryDetails
//
//    }
    
    private func getDecodedCountriesResopnse(from data: Data)-> [Country]? {
        guard let countries = try? JSONDecoder().decode([Country].self, from: data) else {
            return nil
        }
        return countries
    }
    
//    private func getDecodedCountryDetailsResopnse(from data: Data)-> Country.Details? {
//        guard let countryDetails = try? JSONDecoder().decode(Country.Details.self, from: data) else {
//            return nil
//        }
//        return countryDetails
//    }
}

// MARK: - Endpoints

extension RealCountriesRepository {
    enum API {
        case allCountries
        case countryDetails(Country)
    }
}

extension RealCountriesRepository.API: APICall {
    var path: String {
        switch self {
        case .allCountries:
            return "/all"
        case let .countryDetails(country):
            let encodedName = country.name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            return "/name/\(encodedName ?? country.name)"
        }
    }
    var method: String {
        switch self {
        case .allCountries, .countryDetails:
            return "GET"
        }
    }
    var headers: [String: String]? {
        return ["Accept": "application/json"]
    }
    func body() throws -> Data? {
        return nil
    }
}


