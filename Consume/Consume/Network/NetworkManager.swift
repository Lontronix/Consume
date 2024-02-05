//
//  NetworkManager.swift
//  Consume
//
//  Created by Lonnie Gerol on 2/4/24.
//

import Foundation

class NetworkManager {

    static let jsonDecoder: JSONDecoder = {
        return JSONDecoder()
    }()

    enum NetworkManagerError: Error {
        case invalidStatusCode
        case malformedRequest
        case malformedResult
    }

    private static let baseURL = URL(string: "https://themealdb.com/api/json/v1/1/")!

    static func performDataTask<T>(
        withRequest request: T
    ) async throws -> T.Result where T:DataRequest {
        let request = URLRequest(url: request.constructRequestURL(withBaseURL: baseURL))
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse else { throw NetworkManagerError.malformedRequest }
        guard response.statusCode == 200 else { throw NetworkManagerError.invalidStatusCode }

        do {
            let result = try jsonDecoder.decode(T.Result.self, from: data)
            return result
        } catch {
            throw NetworkManagerError.malformedResult
        }
    }

}
