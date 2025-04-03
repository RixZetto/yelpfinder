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
    let service: YelpServiceProtocol = YelpServiceJsonMock()
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
            ContentView(service: service)
        }
        .modelContainer(sharedModelContainer)
    }
}
