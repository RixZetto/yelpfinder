//
//  MockData.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 3/04/25.
//

struct MockData {
    
    static let locations = [
        Location(address1: "123 Main St",
                 address2: "AC",
                 address3:  "OH",
                 city: "San Francisco",
                 zipCode: "94103",
                 country: "US",
                 state: "CA",
                 displayAddress: ["123 Main St", "AC", "OH", "94103"],
                 crossStreet: nil
                ),
        Location(address1: "456 Elm St",
                 address2: "",
                 address3:  "",
                 city: "New York",
                 zipCode: "10001",
                 country: "US",
                 state: "NY",
                 displayAddress: ["123 Main St", "AC", "OH", "94103"],
                 crossStreet: nil),
        Location(address1: "789 Oak St",
                 address2: "",
                 address3:  "",
                 city: "Los Angeles",
                 zipCode: "90001",
                 country: "US",
                 state: "CA",
                 displayAddress: ["123 Main St", "AC", "OH", "94103"],
                 crossStreet: nil)
    ]

    static let categories = [
        Category(alias: "coffee", title: "Coffee & Tea"),
        Category(alias: "restaurant", title: "Restaurants"),
        Category(alias: "bar", title: "Bars")
    ]
    
    static let businesses = [
        Business(
            id: "1",
            alias: "cofcen",
            name: "Coffee Center",
            imageUrl: "https://source.unsplash.com/200x200/?cafe",
            isClosed: false,
            url: "https://www.yelp.com/biz/mock-cafe",
            reviewCount: 124,
            categories: [Category(alias: "coffee", title: "Coffee & Tea")],
            rating: 4.5,
            coordinates: Coordinate(latitude: 33.669445, longitude: -117.823059),
            transactions: ["pickup", "delivery"],
            price: "$$",
            location: Location(address1: "123 Main St",
                               address2: "AA",
                               address3: "CCC",
                               city: "San Francisco",
                               zipCode: "94103",
                               country: "US",
                               state: "CA",
                               displayAddress: ["123 Main St", "AA", "CCC"],
                               crossStreet: nil),
            phone: "+14155551234",
            displayPhone: "(415) 555-1234",
            distance: 1200.5
        ),
        Business(
            id: "2",
            alias: "pizza-place",
            name: "PizzaHut",
            imageUrl: "https://source.unsplash.com/200x200/?restaurant",
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
        ),
        Business(
            id: "3",
            alias: "starbucks south",
            name: "Starbuck Coffee Shop South",
            imageUrl: "https://blog.logomaster.ai/hs-fs/hubfs/starbucks%20logo%20current.jpg?width=1700&height=1148&name=starbucks%20logo%20current.jpg",
            isClosed: true,
            url: "https://www.yelp.com/biz/mock-restaurant",
            reviewCount: 87,
            categories: [
                Category(alias: "restaurant", title: "Restaurants")
            ],
            rating: 4.0,
            coordinates: Coordinate(latitude: 33.669445, longitude: -117.823059),
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
        ),
        Business(
            id: "4",
            alias: "starbucks",
            name: "Starbuck Coffee Shop",
            imageUrl: "https://static.vecteezy.com/system/resources/previews/044/625/960/non_2x/starbucks-logotype-on-white-background-starbucks-corporation-logo-american-coffee-company-chain-of-coffee-houses-popular-drinks-beverage-take-with-you-cafe-editorial-free-vector.jpg",
            isClosed: true,
            url: "https://www.yelp.com/biz/mock-restaurant",
            reviewCount: 87,
            categories: [
                Category(alias: "restaurant",
                         title: "Restaurants")
            ],
            rating: 4.0,
            coordinates: Coordinate(latitude: 34.0522,
                                    longitude: -118.2437),
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
        )
    ]
    
    
}
