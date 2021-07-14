//
//  Endpoint.swift
//  desafio
//
//  Created by Victor Valfre on 13/07/21.
//

import Foundation
import Alamofire

enum ProductEndpoint: ApiConfiguration {
    case listProducts(request: AdsRequest?)

    
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
            case .listProducts(let request):
                var paramenters : [String : Any] = [String : Any]()
                if let requestData = request {
                    paramenters.updateValue(requestData.lim, forKey: "lim")
                    paramenters.updateValue(requestData.region, forKey: "region")
                    paramenters.updateValue(requestData.sort, forKey: "sort")
                    paramenters.updateValue(requestData.state, forKey: "state")
                    paramenters.updateValue(requestData.lang, forKey: "lang")
                    return paramenters
                }
                return nil
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
