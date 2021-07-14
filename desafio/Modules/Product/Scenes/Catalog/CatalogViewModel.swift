//
//  CatalogViewModel.swift
//  desafio
//
//  Created by Victor Valfre on 13/07/21.
//

import Foundation
import Promises

class CatalogViewModel {
    var ads: [Ad] = []
    
    func getAds(request: AdsRequest?) -> Promise<ListAds> {
        // "https://nga.olx.com.br/api/v1.2/public/ads?lim=25&region=11&sort=relevance&state=1&lang=pt"
        if let parameterRequest = request {
             return ProductApiClient.listProducts(request: parameterRequest)
        }
        let defaultRequest = AdsRequest(lim: 25, region: 11, sort: "relevance", state: 1, lang: "pt")
        return ProductApiClient.listProducts(request: defaultRequest)
    }
    
    func updateAds(list: [Ad]) {
        self.ads.append(contentsOf: list)
    }
}
