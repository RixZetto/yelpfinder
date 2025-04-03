//
//  AsyncSequence+Extension.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 2/04/25.
//

extension AsyncSequence {
    func first() async throws -> Element? {
        try await first(where: { _ in true })
    }
}
