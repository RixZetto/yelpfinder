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
    @StateObject var viewModel = ContentViewModel()
    @Query private var items: [Item]
    
    var body: some View {
        NavigationSplitView {
  
            VStack {
                
                VStack(spacing: 20) {
                    SearchBar(text: $viewModel.searchText)
                    
                    if viewModel.businesses.isEmpty {
                        Text("No businesses found")
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
                            VStack {
                                KFImage(URL(string: business.imageUrl))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 300)
                                
                                Text(business.name)
                                RatingView(rating: business.rating)
                                Text(business.description)
                            }
                        } label: {
                            VStack(spacing: 10) {
                                KFImage(URL(string: business.imageUrl))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 300)
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(business.name)
                                        .font(.headline)
                                        .lineLimit(1)
                                    RatingView(rating: business.rating)
                                    Text(business.description)
                                        .font(.body)
                                        .lineLimit(2)
                                }
                            }
                            
                            .listRowInsets(EdgeInsets())
                            .listRowBackground(Color.clear)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(PlainListStyle())
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
            }
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
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
