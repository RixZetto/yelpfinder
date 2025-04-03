//
//  YelpFinderStoreTests.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 3/04/25.
//

import Testing

struct YelpFinderStoreTests {
    
    @Test
    func storeInMemoryAndCheckDataExpiredAfterFiveSeconds() async throws {
        let store = InMemoryCacheStore<AutoCompleteResponse>(expirationTime: 5)
        
        let key = "autocomplete?text=coffee"
        let response1 = store.retrieve(forKey: key)
        #expect(response1 == nil)
        
        let item = AutoCompleteResponse(categories: [], businesses: [
            AutoCompleteBusiness(alias: "abc", title: "ABC SA"),
            AutoCompleteBusiness(alias: "company", title: "Company LLC")
        ], terms: [])
        store.store(item: item, forKey: key)
        
        let response2 = store.retrieve(forKey: key)
        #expect(response2 != nil)
        #expect(response2!.businesses.count == 2)
        
        try await Task.sleep(for: .seconds(6))
        
        #expect(store.retrieve(forKey: key) == nil)
    }
    
    @Test func storeLocallyAndCheckDataExpiredAfterFiveSeconds() async throws {
        let store = PersistentCacheStore<AutoCompleteResponse>(name: "test_autocomplete_response", expirationTime: 5) // five seconds
        let key = "autocomplete?text=coffee"
        let response1 = store.retrieve(forKey: key)
        #expect(response1 == nil)
        
        let item = AutoCompleteResponse(categories: [], businesses: [
            AutoCompleteBusiness(alias: "abc", title: "ABC SA"),
            AutoCompleteBusiness(alias: "company", title: "Company LLC")
        ], terms: [])
        store.store(item: item, forKey: key)
        
        let response2 = store.retrieve(forKey: key)
        #expect(response2 != nil)
        #expect(response2!.businesses.count == 2)
        
        try await Task.sleep(for: .seconds(6))
        
        #expect(store.retrieve(forKey: key) == nil)
    }
    
    
}
