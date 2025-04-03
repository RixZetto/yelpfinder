//
//  ContentViewModel.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 3/04/25.
//
import Foundation
import Combine

class ContentViewModel: ObservableObject {
    private let hardcodedLatitude = 32.6514
    private let hardcodedLongitude = -161.4333
    private var cancellables: Set<AnyCancellable> = []
    private var service: YelpServiceProtocol!
    @Published var searchText: String = ""
    @Published var businesses: [Business] = []
    @Published var resultForText: String = ""
    
    init() {
        self.service = YelpService()
        $searchText
            .debounce(for: .milliseconds(500),
                      scheduler: RunLoop.main)
            .sink { [weak self] text in
                self?.performSearch(query: text)
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Service Handlers
    
    func performSearch(query: String) {
        let searchText = query.isEmpty ? nil : query
        self.service.fetchBusinesses(withText: searchText,
                                latitude: hardcodedLatitude,
                                longitude: hardcodedLongitude)
        .sink(receiveCompletion: { _ in },
              receiveValue: { [weak self] result in
                self?.businesses = result.businesses
                self?.resultForText = query
        })
        .store(in: &cancellables)
    }
    
    
}
