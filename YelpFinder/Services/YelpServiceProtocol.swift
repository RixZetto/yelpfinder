//
//  YelpServiceProtocol.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 2/04/25.
//

import Combine

protocol YelpServiceProtocol {
    
    func autoComplete(withText text: String, latitude: Double, longitude: Double) throws -> AnyPublisher<AutoCompleteResponse, Error>
    
    func fetchBusinesses(withText text: String?, latitude: Double, longitude: Double) throws -> AnyPublisher<BusinessesResponse, Error>
    
}
