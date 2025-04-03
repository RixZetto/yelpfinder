//
//  AnyCacheStore.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 3/04/25.
//

import Foundation

enum CacheType {
    case memory
    case persistent(name: String)
}

class AnyCacheStore<T: Codable>: CacheStoreProtocol {
   
    typealias Item = T
    
    private let _create: (T, String) -> Void
    private let _retrieve: (String) -> T?
    private let _remove: (String) -> Void
    
    init<C: CacheStoreProtocol>(_ cache: C) where C.Item == T {
        self._create = cache.create
        self._retrieve = cache.retrieve
        self._remove = cache.remove
    }
    
    func create(item: T, forKey key: String) {
        _create(item, key)
    }
    
    func retrieve(forKey key: String) -> T? {
        return _retrieve(key)
    }
    
    func remove(forKey key: String) {
        _remove(key)
    }
    
}

extension CacheType {
    static func makeCache<T: Codable>(type: CacheType, expirationTime: TimeInterval = 3600) -> AnyCacheStore<T> {
        switch type {
            
        case .memory:
            return AnyCacheStore(InMemoryCacheStore<T>(expirationTime: expirationTime))
        case .persistent(let name):
            return AnyCacheStore(PersistentCacheStore<T>(name: name,
                                                         expirationTime: expirationTime))
        }
    }
}
