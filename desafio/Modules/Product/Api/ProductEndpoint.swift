//
//  Endpoint.swift
//  desafio
//
//  Created by Victor Valfre on 13/07/21.
//

import Foundation
import Alamofire

enum ProductEndpoint: ApiConfiguration {
    case listProducts

    
    var baseUrl: String {
        return EnvironmentUtils.BaseUrl
    }
    
    var method: HTTPMethod {
        switch self {
            default:
                return .get
        }
    }
    
    var path: String {
        switch self {
        case .listProducts:
            return "ads"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        default:
            return nil
        }
    }
    
    var httpBody: Data? {
        switch self {
        default:
            return nil
        }
        
    }
    
    var headers: HTTPHeaders? {
        switch self {
        default:
            return nil
        }
    }
}
