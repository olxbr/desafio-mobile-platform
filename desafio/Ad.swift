//
//  Ad.swift
//  desafio
//
//  Created by Fernando Luiz Goulart on 13/04/21.
//

import Foundation

struct ListAds: Decodable {
    let list_ads: [Ad]?
}

struct Ad: Decodable {
    let ad: AdDetail
}

struct AdDetail: Decodable {
    let subject: String
    let thumbnail: AdThumbnail?
    let prices: [AdPrice]?
    let locations: [AdLocation]
    let list_time: AdListTime
}

struct AdThumbnail: Decodable {
    let height: Int
    let width: Int
    let path: String
    let base_url: String
    let media_id: String
}

struct AdPrice: Decodable {
    let label: String
    let price_value: Int
}

struct AdLocation: Decodable {
    let code: String?
    let key: String?
    let label: String?
    let locations: [AdLocation]?
}

struct AdListTime: Decodable {
    let label: String
    let value: Int
}
