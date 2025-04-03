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
    @Query private var items: [Item]
    
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
                    .onDelete(perform: deleteItems)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
            }.background(.thinMaterial)
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView(service: YelpServiceMock())
        .modelContainer(for: Item.self, inMemory: true)
}
