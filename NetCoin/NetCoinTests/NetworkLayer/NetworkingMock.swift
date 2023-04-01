//
//  URLProtocolMock.swift
//  NetCoinTests
//
//  Created by Kwabena Ankamah on 08/12/2022.
//

import Foundation
@testable import NetCoin

class NetworkingMock: Networking {
    static var data: Data?

    func data(
        from url: URL,
        delegate: URLSessionTaskDelegate?
    ) async throws -> (Data, URLResponse) {
        guard let data = NetworkingMock.data else {
            throw NetworkError.dataNotFound
        }
        return (data, URLResponse())
    }
}
