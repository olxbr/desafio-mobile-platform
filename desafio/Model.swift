//
//  Model.swift
//  desafio
//
//  Created by Fernando Luiz Goulart on 13/04/21.
//

import Foundation

struct Ad: Codable {
    let ad: AdSummary
    let thumbnail: AdThumbnail
    let prices: [AdPrice]
    let locations: [AdLocation]
    let list_time: AdListTime
}

struct AdSummary: Codable {
    let subject: String
}

struct AdThumbnail: Codable {
    let height: Int
    let width: Int
    let path: String
    let base_url: String
    let media_id: String
}

struct AdPrice: Codable {
    let label: String
    let price_value: Int
}

struct AdLocation: Codable {
    let code: String?
    let key: String?
    let label: String?
    let locations: [AdLocation]?
}

struct AdListTime: Codable {
    let label: String
    let value: Int
}
