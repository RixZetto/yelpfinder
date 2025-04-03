//
//  BusinessDetail.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 3/04/25.
//

import SwiftUI
import Kingfisher

struct BusinessDetail: View {
    let business: Business
    
    var body: some View {
        VStack(spacing: 20) {
            KFImage(URL(string: business.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(height: 300)
            Text(business.name)
                .font(.title)
            RatingView(rating: business.rating)
            Text(business.description)
                .font(.body)
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "heart")
                Text("Add to Favorite")
            }.buttonStyle(.borderedProminent)

        }.padding(20)
    }
}

#Preview {
    BusinessDetail(business: Business(
        id: "2",
        alias: "pizza-place",
        name: "PizzaHut",
        imageUrl: "https://s3-media2.fl.yelpcdn.com/bphoto/ZEat-1Df8KGUW8fhHKfx_A/o.jpg",
        isClosed: true,
        url: "https://www.yelp.com/biz/mock-restaurant",
        reviewCount: 87,
        categories: [Category(alias: "restaurant", title: "Restaurants")],
        rating: 4.0,
        coordinates: Coordinate(latitude: 34.0522, longitude: -118.2437),
        transactions: ["delivery"],
        price: "$$$",
        location: Location(address1: "456 Elm St",
                           address2: "CE",
                           address3: "DEE",
                           city: "Los Angeles",
                           zipCode: "90001",
                           country: "US",
                           state: "CA",
                           displayAddress: ["456 Elm St", "CE", "DEE"],
                           crossStreet: nil
                          ),
        phone: "+13105551234",
        displayPhone: "(310) 555-1234",
        distance: 2450.7
    ))
}
