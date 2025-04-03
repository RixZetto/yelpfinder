//
//  YelpServiceJsonMock.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 3/04/25.
//
import Foundation
import Combine

class YelpServiceJsonMock: YelpServiceProtocol {
    
    func autoComplete(withText text: String) -> AnyPublisher<AutoCompleteResponse, any Error> {
        if let response = String.fromJson(filename: "autocomplete_response",
                                          in: Bundle(for: YelpServiceJsonMock.self)) {
            let data = response.data(using: .utf8)!
            return Just(try! JSONDecoder().decode(AutoCompleteResponse.self, from: data))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
        return Fail(error: URLError(.badServerResponse))
            .eraseToAnyPublisher()
    }
    
    
    func fetchBusinesses(withText text: String?, latitude: Double, longitude: Double) -> AnyPublisher<BusinessesResponse, any Error> {
        if let response = String.fromJson(filename: "businesses_response",
                                          in: Bundle(for: YelpServiceJsonMock.self)) {
            let data = response.data(using: .utf8)!
            return Just(try! JSONDecoder().decode(BusinessesResponse.self, from: data))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
        return Fail(error: URLError(.badServerResponse))
            .eraseToAnyPublisher()
        
    }
    
    
}
