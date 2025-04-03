//
//  ContentViewModel.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 3/04/25.
//
import Foundation
import Combine

class ContentViewModel: ObservableObject {
    private let hardcodedLatitude = 33.669445
    private let hardcodedLongitude = -117.823059
    private var cancellables: Set<AnyCancellable> = []
    private var service: YelpServiceProtocol!
    private var cache: AnyCacheStore<BusinessesResponse>!
    @Published var isSearching: Bool = false
    @Published var searchText: String = ""
    @Published var businesses: [Business] = []
    @Published var resultForText: String = ""
    @Published var errorMessage: String?
    
    init(service: YelpServiceProtocol,
         cache: AnyCacheStore<BusinessesResponse>) {
        self.service = service
        self.cache = cache
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
        errorMessage = nil
        isSearching = true
        let searchText = query.isEmpty ? nil : query
        let cacheKey = "businesses_query_\(searchText ?? "")"
        do {
            // retrieve cache
            
            if let cachedResult = self.cache.retrieve(forKey: cacheKey) {
                self.businesses = cachedResult.businesses
                self.resultForText = query
                self.isSearching = false
                return
            }
            
            try self.service.fetchBusinesses(withText: searchText,
                                    latitude: hardcodedLatitude,
                                    longitude: hardcodedLongitude)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] result in
                self?.businesses = result.businesses
                self?.resultForText = query
            
                // store cache
                self?.cache.create(item: result, forKey: cacheKey)
                self?.isSearching = false
            })
            .store(in: &cancellables)
            
        } catch {
            print(error.localizedDescription)
            errorMessage = "Error on fetching data"
            isSearching = false
        }
    }
    
    
}
