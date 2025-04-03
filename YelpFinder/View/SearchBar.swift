//
//  SearchBar.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 3/04/25.
//
import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @FocusState var isFocused: Bool
    
    var body: some View {
        HStack {
            
            Image(systemName: "magnifyingglass").foregroundColor(.gray)
            
            TextField("Search", text: $text)
                .focused($isFocused)
                .font(.body)
                .padding(1)
            
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 4)
    }
}

// MARK: - Preview
#Preview {
    @Previewable @State var text: String = ""
    VStack {
        SearchBar(text: $text)
        Text("\(text)")
    }
}
