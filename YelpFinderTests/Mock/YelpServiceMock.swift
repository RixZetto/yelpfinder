//
//  YelpServiceMock.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 2/04/25.
//

import Foundation
import Combine

class YelpServiceMock: YelpServiceProtocol {
    
    func autoComplete(withText text: String) -> AnyPublisher<AutoCompleteResponse, any Error> {
        
        let categories: [AutoCompleteCategory] = MockData.categories.filter {
            $0.alias.localizedCaseInsensitiveContains(text) ||
            $0.title.localizedCaseInsensitiveContains(text)
        }.map {
            AutoCompleteCategory(alias: $0.alias, title: $0.title)
        }
        
        let businesses: [AutoCompleteBusiness] = MockData.businesses.filter {
            $0.alias.localizedCaseInsensitiveContains(text) ||
            $0.name.localizedCaseInsensitiveContains(text)
        }.map {
            AutoCompleteBusiness(alias: $0.alias, title: $0.name)
        }
        let terms = [AutoCompleteTerms]()
        
        
        let response = AutoCompleteResponse(categories: categories,
                                            businesses: businesses,
                                            terms: terms)
        
        return Just(response)
            .setFailureType(to: Error.self)
            .delay(for: .seconds(1), scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchBusinesses(withText text: String?, latitude: Double, longitude: Double) -> AnyPublisher<BusinessesResponse, any Error> {
        
        var filteredBusinesses = MockData.businesses.filter { // filter by location
            $0.coordinates.latitude == latitude && $0.coordinates.longitude == longitude
        }
        
        if let filterText = text {
            filteredBusinesses = filteredBusinesses.filter {
                $0.alias.localizedCaseInsensitiveContains(filterText) || $0.name.localizedCaseInsensitiveContains(filterText)
            }
        }
        
        let region = Region(center: Center(longitude: longitude, latitude: latitude))
        let response = BusinessesResponse(businesses: filteredBusinesses,
                                          total: filteredBusinesses.count,
                                          region: region)
        
        return Just(response)
            .setFailureType(to: Error.self)
            .delay(for: .seconds(1), scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    
    
}
