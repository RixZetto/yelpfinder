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
    
    enum AuthenticationError: Error {
        case invalidApiKey
    }
    
    func getApiKey() throws -> String {
        guard let apiKey = Bundle.main.infoDictionary?["YelpApiKey"] as? String else {
            throw AuthenticationError.invalidApiKey
        }
        return apiKey
    }
    
    func autoComplete(withText text: String, latitude: Double, longitude: Double) throws -> AnyPublisher<AutoCompleteResponse, any Error> {
        let apiKey = try getApiKey()
        var components = URLComponents(string: "\(baseURL)autocomplete")!
        components.queryItems = [
            URLQueryItem(name: "text", value: text),
            URLQueryItem(name: "locale", value: "en_US"),
            URLQueryItem(name: "latitude", value: String(latitude)),
            URLQueryItem(name: "longitude", value: String(longitude))
        ]
        
        guard let url = components.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: AutoCompleteResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main )
            .eraseToAnyPublisher()
    }
    
    func fetchBusinesses(withText text: String?, latitude: Double, longitude: Double) throws -> AnyPublisher<BusinessesResponse, any Error> {
        let apiKey = try getApiKey()
        var components = URLComponents(string: "\(baseURL)businesses/search")!
        components.queryItems = [
            URLQueryItem(name: "locale", value: "en_US"),
            URLQueryItem(name: "latitude", value: String(latitude)),
            URLQueryItem(name: "longitude", value: String(longitude))
        ]
        
        if let filterText = text {
            components.queryItems?.append(URLQueryItem(name: "term", value: filterText))
        }
        
        guard let url = components.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: BusinessesResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main )
            .eraseToAnyPublisher()
    }
    
}
