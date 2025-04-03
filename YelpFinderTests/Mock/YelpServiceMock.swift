//
//  YelpServiceMock.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 2/04/25.
//

import Foundation
import Combine

class YelpServiceMock: YelpServiceProtocol {
    
    private let  categories = [
        Category(alias: "coffee", title: "Coffee & Tea"),
        Category(alias: "restaurant", title: "Restaurants"),
        Category(alias: "bar", title: "Bars")
    ]
    
    private let businesses = [
                Business(
                    id: "1",
                    alias: "cofcen",
                    name: "Coffee Center",
                    imageUrl: "https://source.unsplash.com/200x200/?cafe",
                    isClosed: false,
                    url: "https://www.yelp.com/biz/mock-cafe",
                    reviewCount: 124,
                    categories: [Category(alias: "coffee", title: "Coffee & Tea")],
                    rating: "4.5",
                    coordinates: [Coordinate(latitude: 33.669445, longitude: -117.823059)],
                    transactions: ["pickup", "delivery"],
                    price: "$$",
                    location: Location(address1: "123 Main St",
                                       address2: "AA",
                                       address3: "CCC",
                                       city: "San Francisco",
                                       zipCode: "94103",
                                       country: "US",
                                       state: "CA",
                                       displayAddress: ["123 Main St", "AA", "CCC"],
                                       crossStreet: nil),
                    phone: "+14155551234",
                    displayPhone: "(415) 555-1234",
                    distance: "1200.5",
                    total: 0
                ),
                Business(
                    id: "2",
                    alias: "pizza-place",
                    name: "PizzaHut",
                    imageUrl: "https://source.unsplash.com/200x200/?restaurant",
                    isClosed: true,
                    url: "https://www.yelp.com/biz/mock-restaurant",
                    reviewCount: 87,
                    categories: [Category(alias: "restaurant", title: "Restaurants")],
                    rating: "4.0",
                    coordinates: [Coordinate(latitude: 34.0522, longitude: -118.2437)],
                    transactions: ["delivery"],
                    price: "$$$",
                    location: Location(address1: "456 Elm St",
                                       address2: "CE",
                                       address3: "DEE",
                                       city: "Los Angeles",
                                       zipCode: "90001",
                                       country: "US",
                                       state: "CA",
                                       displayAddress: ["456 Elm St", "CE", "DEE"],
                                       crossStreet: nil
                                      ),
                    phone: "+13105551234",
                    displayPhone: "(310) 555-1234",
                    distance: "2450.7",
                    total: 0
                ),
                Business(
                    id: "3",
                    alias: "starbucks south",
                    name: "Starbuck Coffee Shop South",
                    imageUrl: "https://blog.logomaster.ai/hs-fs/hubfs/starbucks%20logo%20current.jpg?width=1700&height=1148&name=starbucks%20logo%20current.jpg",
                    isClosed: true,
                    url: "https://www.yelp.com/biz/mock-restaurant",
                    reviewCount: 87,
                    categories: [Category(alias: "restaurant", title: "Restaurants")],
                    rating: "4.0",
                    coordinates: [Coordinate(latitude: 33.669445, longitude: -117.823059)],
                    transactions: ["delivery"],
                    price: "$$$",
                    location: Location(address1: "456 Elm St",
                                       address2: "CE",
                                       address3: "DEE",
                                       city: "Los Angeles",
                                       zipCode: "90001",
                                       country: "US",
                                       state: "CA",
                                       displayAddress: ["456 Elm St", "CE", "DEE"],
                                       crossStreet: nil
                                      ),
                    phone: "+13105551234",
                    displayPhone: "(310) 555-1234",
                    distance: "2450.7",
                    total: 0
                ),
                Business(
                    id: "4",
                    alias: "starbucks",
                    name: "Starbuck Coffee Shop",
                    imageUrl: "https://static.vecteezy.com/system/resources/previews/044/625/960/non_2x/starbucks-logotype-on-white-background-starbucks-corporation-logo-american-coffee-company-chain-of-coffee-houses-popular-drinks-beverage-take-with-you-cafe-editorial-free-vector.jpg",
                    isClosed: true,
                    url: "https://www.yelp.com/biz/mock-restaurant",
                    reviewCount: 87,
                    categories: [Category(alias: "restaurant", title: "Restaurants")],
                    rating: "4.0",
                    coordinates: [Coordinate(latitude: 34.0522, longitude: -118.2437)],
                    transactions: ["delivery"],
                    price: "$$$",
                    location: Location(address1: "456 Elm St",
                                       address2: "CE",
                                       address3: "DEE",
                                       city: "Los Angeles",
                                       zipCode: "90001",
                                       country: "US",
                                       state: "CA",
                                       displayAddress: ["456 Elm St", "CE", "DEE"],
                                       crossStreet: nil
                                      ),
                    phone: "+13105551234",
                    displayPhone: "(310) 555-1234",
                    distance: "2450.7",
                    total: 0
                )
            ]
    
    func autoComplete(withText text: String) -> AnyPublisher<AutoCompleteResponse, any Error> {
        
        let categories: [AutoCompleteCategory] = self.categories.filter {
            $0.alias.localizedCaseInsensitiveContains(text) ||
            $0.title.localizedCaseInsensitiveContains(text)
        }.map {
            AutoCompleteCategory(alias: $0.alias, title: $0.title)
        }
        
        let businesses: [AutoCompleteBusiness] = self.businesses.filter {
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
        
        
            let locations = [
                Location(address1: "123 Main St",
                         address2: "AC",
                         address3:  "OH",
                         city: "San Francisco",
                         zipCode: "94103",
                         country: "US",
                         state: "CA",
                         displayAddress: ["123 Main St", "AC", "OH", "94103"],
                         crossStreet: nil
                        ),
                Location(address1: "456 Elm St",
                         address2: "",
                         address3:  "",
                         city: "New York",
                         zipCode: "10001",
                         country: "US",
                         state: "NY",
                         displayAddress: ["123 Main St", "AC", "OH", "94103"],
                         crossStreet: nil),
                Location(address1: "789 Oak St",
                         address2: "",
                         address3:  "",
                         city: "Los Angeles",
                         zipCode: "90001",
                         country: "US",
                         state: "CA",
                         displayAddress: ["123 Main St", "AC", "OH", "94103"],
                         crossStreet: nil)
            ]

        var filteredBusinesses = businesses.filter { // filter by location
            $0.coordinates.contains { coordinate in
                coordinate.latitude == latitude && coordinate.longitude == longitude
            }
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
