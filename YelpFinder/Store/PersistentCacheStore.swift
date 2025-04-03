//
//  PersistentCacheStore.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 3/04/25.
//
import Foundation

/// This class store any codable item as a json file in a directory indicated in the constructor as name parameter
class PersistentCacheStore<T: Codable>: CacheStoreProtocol {
    private struct CodableCacheItem: Codable {
        let item: T
        let expirationDate: Date
    }
    
    private let cacheFilename: URL
    private let expirationTime: TimeInterval

    init (name: String, expirationTime: TimeInterval = 3600) { // 1 hour
        self.expirationTime = expirationTime
        
        let directory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        self.cacheFilename = directory.appendingPathComponent(name)
        
        print(directory)
        
        // create directory for the first time
        if !FileManager.default.fileExists(atPath: self.cacheFilename.path) {
            try? FileManager.default.createDirectory(at: cacheFilename, withIntermediateDirectories: true, attributes: nil)
        }
    }
    
    func store(item: T, forKey key: String) {
        let expirationDate = Date().addingTimeInterval(expirationTime)
        let cacheItem = CodableCacheItem(item: item, expirationDate: expirationDate)
        guard let data = try? JSONEncoder().encode(cacheItem) else { return }
        
        let fileURL = cacheFilename.appendingPathComponent(key)
        try? data.write(to: fileURL)
    }
    
    func retrieve(forKey key: String) -> T? {
        let fileURL = cacheFilename.appendingPathComponent(key)
        
        guard FileManager.default.fileExists(atPath: fileURL.path),
              let data = try? Data(contentsOf: fileURL),
              let cacheItem = try? JSONDecoder().decode(CodableCacheItem.self, from: data),
              cacheItem.expirationDate > Date() //checking expiration time
        else {
            remove(forKey: key)
            return nil
        }
        
        return cacheItem.item
    }
    
    func remove(forKey key: String) {
        let fileURL = cacheFilename.appendingPathComponent(key)
        try? FileManager.default.removeItem(at: fileURL)
    }
    
}
