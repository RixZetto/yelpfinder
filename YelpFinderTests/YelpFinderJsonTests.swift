//
//  YelpFinderJsonTests.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 3/04/25.
//
import Testing
import Combine
@testable import YelpFinder

struct YelpFinderJsonTests {
    let yelpService: any YelpServiceProtocol
    
    init() {
        self.yelpService = YelpServiceJsonMock()
        print("Start Testing...")
    }
    
    
    @Test("YelpService should parse the Real Json Response for Businesses API Rest Call")
    func fetchBusinessesByParsingJsonResponse() async throws {
        
        // method will ignore input parameters
        let value = try await yelpService.fetchBusinesses(withText: nil, latitude: 0, longitude: 0).values.first()
        
        #expect(value != nil)
        #expect(value!.total == 1300)
        #expect(value!.businesses.first!.name == "Ever After Tearoom & Eatery")
    }
    
    @Test("YelpService should parse the Real json Response for AutoComplete API Rest Call")
    func fetchAutoCompleteByParsingJsonResponse() async throws {
        let value = try await yelpService.autoComplete(withText: "").values.first()
        #expect(value != nil)
        #expect(value!.categories.count > 0)
    }
}
