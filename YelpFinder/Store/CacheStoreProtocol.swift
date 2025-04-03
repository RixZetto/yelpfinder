//
//  CacheStoreProtocol.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 3/04/25.
//

protocol CacheStoreProtocol {
    associatedtype Item
    func store(item: Item, forKey key: String)
    func retrieve(forKey key: String) -> Item?
    func remove(forKey key: String)
}
