//
//  YelpFinderTests.swift
//  YelpFinderTests
//
//  Created by Ricardo Rodríguez on 2/04/25.
//

import Testing
import Combine
@testable import YelpFinder

struct YelpFinderTests {
    let yelpService: any YelpServiceProtocol

    init() {
        self.yelpService = YelpServiceMock()
        print("Start Testing...")
    }
    

    @Test("YelpService list autocomplete results for 'caf'")
    mutating func checkAutoCompleteResults() async throws {
        
        let value = try await yelpService.autoComplete(withText: "cof", latitude: 33.669445, longitude: -117.823059).values.first()
        #expect(value != nil)
        
        #expect(value!.businesses.count == 3)
        #expect(value!.categories.count == 1)
    }
    
    @Test("YelpService fetch business without filter")
    mutating func fetchBusinessWithoutFilter() async throws {
        let value = try await yelpService.fetchBusinesses(withText: nil, latitude: 33.669445, longitude: -117.823059).values.first()
        #expect(value != nil)
        #expect(value!.total == 2)
    }
    
    @Test("YelpService fetch businesses with text filter") mutating func fetchBusinessesWithTextFilter() async throws {
        let value = try await yelpService.fetchBusinesses(withText: "cof", latitude: 33.669445, longitude: -117.823059).values.first()
        #expect(value != nil)
        #expect(value!.total == 2)
    }
    
    
}
