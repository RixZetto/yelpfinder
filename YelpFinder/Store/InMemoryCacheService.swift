//
//  InMemoryCacheStore.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 3/04/25.
//

import Foundation

/// This class store data in memory 
class InMemoryCacheStore<T: Codable>: CacheStoreProtocol {
    private struct CacheData {
        let item: T
        let expiration: Date
    }
    
    private var storage: [String: CacheData] = [:]
    private var expirationTime: TimeInterval
    
    init(expirationTime: TimeInterval = 3600) {
        self.expirationTime = expirationTime
    }
    
    func create(item: T, forKey key: String) {
        let expirationDate = Date().addingTimeInterval(expirationTime)
        storage[key.lowercased()] = CacheData(item: item, expiration: expirationDate)
    }
    
    func retrieve(forKey key: String) -> T? {
        guard let cachedItem = storage[key.lowercased()],
              cachedItem.expiration > Date() // check if is expired
        else { return nil }
        return cachedItem.item
    }
    
    func remove(forKey key: String) {
        storage[key] = nil
    }
    
}

