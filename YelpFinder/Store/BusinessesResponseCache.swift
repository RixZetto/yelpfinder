//
//  BusinessesResponseCache.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 3/04/25.
//

class BusinessesResponseCache<Store: CacheStoreProtocol> where Store.Item == BusinessesResponse {
    let store: Store
    init(store: Store) {
        self.store = store
    }
}
