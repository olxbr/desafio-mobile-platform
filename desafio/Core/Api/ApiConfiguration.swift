//
//  ApiConfiguration.swift
//  desafio
//
//  Created by Victor Valfre on 12/07/21.
//

import Foundation
import Alamofire

protocol ApiConfiguration: URLRequestConvertible {
    var baseUrl: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var httpBody: Data? { get }
    var headers: HTTPHeaders? { get }
}

extension ApiConfiguration where Self: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let url = try baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue

        // Common Headers
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if let headers = headers {
            for entry in headers {
                urlRequest.setValue(entry.value, forHTTPHeaderField: entry.name)
            }
        }

        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        urlRequest.httpBody = self.httpBody

        return urlRequest
    }
}
