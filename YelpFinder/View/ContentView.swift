//
//  ContentView.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 2/04/25.
//

import SwiftUI
import SwiftData
import Kingfisher

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel

    init(service: YelpServiceProtocol, cache: AnyCacheStore<BusinessesResponse>) {
        let viewModel = ContentViewModel(service: service, cache: cache)
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationSplitView {
  
            VStack {
                
                VStack(spacing: 20) {
                    SearchBar(text: $viewModel.searchText)
                    
                    if viewModel.businesses.isEmpty {
                        Text("No businesses found")
                    }
                    
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                    }
                    
                    if viewModel.isSearching {
                        ProgressView {
                            Text("Loading businesses...")
                        }
                    }
                    
                    if !viewModel.resultForText.isEmpty {
                        Text("Showing result for '\(viewModel.resultForText)'")
                            .font(.headline)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }.padding(.horizontal, 20)
                
                List {
                    ForEach(viewModel.businesses) { business in
                        NavigationLink {
                            BusinessDetail(business: business)
                        } label: {
                            BusinessRow(business: business)
                        }
                    }
                }.toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            viewModel.showAboutView()
                        }) {
                            Label("About", systemImage: "user.circle")
                        }
                    }
                }
                
            }
            .background(.thinMaterial)

            
        } detail: {
            Text("Select an item")
        }.sheet(isPresented: $viewModel.isAboutViewPresented) {
            Group {
                AboutView()
            }.accessibilityIdentifier("AboutSheet")
                .presentationDetents([.medium, .large])
                .padding(10)
            
        }
    }
    

}

#Preview {
    ContentView(service: YelpServiceJsonMock(),
                cache: CacheType.makeCache(type: .memory))
}
