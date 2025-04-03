//
//  Business.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 2/04/25.
//
import Foundation

//  NOTE: API Docs https://docs.developer.yelp.com/reference/v3_business_search
struct Business: Identifiable, Codable {
    let id: String
    let alias: String
    let name: String
    let imageUrl: String
    let isClosed: Bool
    let url: String
    let reviewCount: Int
    let categories: [Category]
    let rating: String
    let coordinates: [Coordinate]
    let transactions: [String]
    let price: String
    let location: Location
    let phone: String
    let displayPhone: String
    let distance: String
    // attributes
    // businessHours
    let total: Int
    //let region
    
    enum CodingKeys: String, CodingKey {
        case id
        case alias
        case name
        case imageUrl = "image_url"
        case isClosed = "is_closed"
        case url
        case reviewCount = "review_count"
        case categories
        case rating
        case coordinates
        case transactions
        case price
        case location
        case phone
        case displayPhone = "display_phone"
        case distance
        case total
    }
    
}

struct Category: Codable {
    let alias: String
    let title: String
}

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double
}

struct Location: Codable {
    let address1: String
    let address2: String
    let address3: String
    let city: String
    let zipCode: String
    let country: String
    let state: String
    let displayAddress: [String]
    let crossStreet: String?
    
    enum CodingKeys: String, CodingKey {
        case address1 = "address"
        case address2
        case address3
        case city
        case zipCode = "zip_code"
        case country
        case state
        case displayAddress = "display_address"
        case crossStreet = "cross_street"
    }
}
