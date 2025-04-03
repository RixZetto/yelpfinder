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
    @Environment(\.modelContext) private var modelContext
    @StateObject var viewModel: ContentViewModel

    init(service: YelpServiceProtocol) {
        self._viewModel = StateObject(wrappedValue: ContentViewModel(service: service))
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
                }
                
            }
            .background(.thinMaterial)
            
        } detail: {
            Text("Select an item")
        }
    }

}

#Preview {
    ContentView(service: YelpServiceJsonMock())
}
