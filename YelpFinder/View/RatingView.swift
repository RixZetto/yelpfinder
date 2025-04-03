//
//  RatingView.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 3/04/25.
//

import SwiftUI

struct RatingView: View {
    private let maxRating = 5
    let rating: Double
    
    var body: some View {
        HStack(spacing: 4) {
            let completeStar = Int(rating)
            let remainingPart = rating - Double(completeStar)
            
            ForEach(0..<maxRating, id: \.self) { index in
                Image(systemName: starImage(for: index,
                                            completeStar: completeStar,
                                            remainingPart: remainingPart))
                    .foregroundStyle(.yellow)
            }
        }
    }
    
    func starImage(for index: Int, completeStar: Int, remainingPart: Double) -> String {
        if index < completeStar {
            return "star.fill"
        }
        else if(index <= completeStar && remainingPart > 0) {
            return "star.leadinghalf.filled"
        }
        
        return "star"
    }
    
}



#Preview {
    VStack {
        RatingView(rating: 1.0)
        RatingView(rating: 1.5)
        RatingView(rating: 3.0)
        RatingView(rating: 4.5)
        RatingView(rating: 5.0)
    }
}
