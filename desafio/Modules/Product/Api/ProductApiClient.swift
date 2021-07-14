//
//  ProductApiClient.swift
//  desafio
//
//  Created by Victor Valfre on 13/07/21.
//

import Foundation
import Promises
import Alamofire

class ProductApiClient: ApiClient {
    static func listProducts(request: AdsRequest?) -> Promise<ListAds> {
        return performRequestAsync(route: ProductEndpoint.listProducts(request: request))
    }
}
