//
//  AutocompleteResponse.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 2/04/25.
//

// NOTE: API Docs https://docs.developer.yelp.com/reference/v3_autocomplete
struct AutoCompleteBusiness: Codable {
    let alias: String
    let title: String
}

struct AutoCompleteCategory: Codable {
    let alias: String
    let title: String
}

struct AutoCompleteTerms: Codable {
    let text: String
}

struct AutoCompleteResponse: Codable {
    let categories: [AutoCompleteCategory]
    let businesses: [AutoCompleteBusiness]
    let terms: [AutoCompleteTerms]
}
