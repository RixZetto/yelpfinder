//
//  YelpService.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 3/04/25.
//

import Combine
import Foundation

class YelpService: YelpServiceProtocol {
    
    private let baseURL = "https://api.yelp.com/v3/"
    
    func autoComplete(withText text: String) -> AnyPublisher<AutoCompleteResponse, any Error> {
        
        if let json = String.fromJson(filename: "autocomplete_response") {
            let data = json.data(using: .utf8)!
            return Just(try! JSONDecoder().decode(AutoCompleteResponse.self, from: data))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
        return Fail(error: URLError(.badServerResponse)).eraseToAnyPublisher()
    }
    
    func fetchBusinesses(withText text: String?, latitude: Double, longitude: Double) -> AnyPublisher<BusinessesResponse, any Error> {
        
        if let json = String.fromJson(filename: "businesses_response") {
            let data = json.data(using: .utf8)!
            return Just(try! JSONDecoder().decode(BusinessesResponse.self, from: data))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
        return Fail(error: URLError(.badServerResponse)).eraseToAnyPublisher()
    }
    
}
