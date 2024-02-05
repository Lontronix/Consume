//
//  DataRequest.swift
//  Consume
//
//  Created by Lonnie Gerol on 2/4/24.
//

import Foundation

protocol DataRequest {

    associatedtype Result where Result: Decodable

    func constructRequestURL(withBaseURL baseURL: URL) -> URL

}
