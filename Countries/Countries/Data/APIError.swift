//
//  APIError.swift
//  Countries
//
//  Created by Mohammad  on 31/08/22
//

import Foundation

enum APIError: Swift.Error, Equatable {
    case invalidURL
    case httpCode(HTTPCode)
    case unexpectedResponse
    case imageDeserialization
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case let .httpCode(code): return "Unexpected HTTP code: \(code)"
        case .unexpectedResponse: return "Unexpected response from the server"
        case .imageDeserialization: return "Cannot deserialize image from Data"
        }
    }
}

//enum APIError: Error {
//    case emptyRecords
//    case requestFailed
//    case invalidData
//    case responseUnsuccessful
//    case jsonParsingFailed
//    case invalidSearch
//
//    var localizedDescription: String{
//        switch self {
//        case .emptyRecords:
//            return NSLocalizedString("empty_response", comment:"")
//        case .requestFailed:
//            return NSLocalizedString("request_failed", comment:"")
//        case .invalidData:
//            return NSLocalizedString("invalid_data", comment:"")
//        case .responseUnsuccessful:
//            return NSLocalizedString("response_unsucessful", comment:"")
//        case .jsonParsingFailed:
//            return NSLocalizedString("parsing_failed", comment:"")
//        case .invalidSearch:
//            return NSLocalizedString("invalid_search", comment:"")
//        }
//    }
//}
