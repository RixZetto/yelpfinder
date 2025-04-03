//
//  AboutView.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 3/04/25.
//


import SwiftUI

struct AboutView: View {
    var body: some View {
        DevCard(
            appName: "YelpFinder App",
            devName: "Ricardo Rodríguez",
            devEmail: "rrodriguezgarcia@gmail.com",
            devPortfolio: "https://www.rixcode.dev",
            gitUrl: "https://github.com/RixZetto/yelpfinder")
    }
}


#Preview {
    AboutView()
}
