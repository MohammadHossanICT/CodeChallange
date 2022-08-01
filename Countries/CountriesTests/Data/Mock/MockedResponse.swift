//
//  MockedResponse.swift
//  CountriesTests
//
//  Created by Mohammad  on 31/08/22
//

import Foundation
@testable import Countries

extension RequestMocking {
    struct MockedResponse {
        let url: URL
        let result: Result<Data, Swift.Error>
        let httpCode: HTTPCode
        let headers: [String: String]
        let loadingTime: TimeInterval
        let customResponse: URLResponse?
    }
}

extension RequestMocking.MockedResponse {
    enum Error: Swift.Error {
        case failedMockCreation
    }
    
    init(apiCall: APICall, baseURL: String,
            result: Result<Data, Swift.Error>,
            httpCode: HTTPCode = 200,
            headers: [String: String] = ["Content-Type": "application/json"],
            loadingTime: TimeInterval = 0.1
    ) throws {
        guard let url = try apiCall.urlRequest(baseURL: baseURL).url
            else { throw Error.failedMockCreation }
        self.url = url
        switch result {
        case let .success(value):
            self.result = .success(value)
        case let .failure(error):
            self.result = .failure(error)
        }
        self.httpCode = httpCode
        self.headers = headers
        self.loadingTime = loadingTime
        customResponse = nil
    }
    
    init(apiCall: APICall, baseURL: String, customResponse: URLResponse) throws {
        guard let url = try apiCall.urlRequest(baseURL: baseURL).url
            else { throw Error.failedMockCreation }
        self.url = url
        result = .success(Data())
        httpCode = 200
        headers = [String: String]()
        loadingTime = 0
        self.customResponse = customResponse
    }
    
    init(url: URL, result: Result<Data, Swift.Error>) {
        self.url = url
        self.result = result
        httpCode = 200
        headers = [String: String]()
        loadingTime = 0
        customResponse = nil
    }
}


extension Country {
    static let mockedCountriesJsonData: Data = {
        return readLocalJson(fileName:"InvalidSearchResopnse")
    }()
    
    static let mockedCountriesParsingFiledData: Data = {
        return readLocalJson(fileName:"AllCountries")
    }()
    
    static let mockedCountriesEmptyData: Data = {
        return readLocalJson(fileName:"EmptyResponse")
    }()
    
    private static func readLocalJson(fileName: String)-> Data {
        let bundle = Bundle(for:CountriesRepositoryTests.self)
        
        guard let url = bundle.url(forResource:fileName, withExtension:"json"),
              let data = try? Data(contentsOf: url)
        else {
            return Data()
        }
        
        return data
    }
}
