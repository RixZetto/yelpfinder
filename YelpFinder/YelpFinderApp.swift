//
//  YelpFinderApp.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 2/04/25.
//

import SwiftUI
import SwiftData

@main
struct YelpFinderApp: App {

    let businessCache: AnyCacheStore<BusinessesResponse> = CacheType.makeCache(type: .persistent(name: "businesses_response_cache"))
    let service: YelpServiceProtocol = YelpService()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView(service: service, cache: businessCache)
        }
        .modelContainer(sharedModelContainer)
    }
}
