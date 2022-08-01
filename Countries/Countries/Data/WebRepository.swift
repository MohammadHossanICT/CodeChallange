//
//  WebRepository.swift
//  Countries
//
//  Created by Mohammad  on 31/08/22
//

import Foundation

protocol WebRepository {
    var session: URLSession { get }
    var baseURL: String { get }
}

extension WebRepository {
    func call(request: URLRequest) async throws -> Data {
        
        do {
            let (data, _)  = try await session.data(for: request)
            return data
        }catch {
            throw APIError.unexpectedResponse
        }
    }
}

