//
//  BusinessesResponse.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 2/04/25.
//

//  NOTE: API Docs https://docs.developer.yelp.com/reference/v3_business_search
struct BusinessesResponse: Codable {
    let businesses: [Business]
    let total: Int
    let region: Region
}

struct Region: Codable {
    let center: Center
}


struct Center: Codable {
    let longitude: Double
    let latitude: Double
}
