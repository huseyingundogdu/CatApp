//
//  ContentView.swift
//  CatApp
//
//  Created by Huseyin on 02/09/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Image(systemName: "globe")
                    Text("Explore")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            LikedView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Liked")
                }
        }
    }
}

#Preview {
    ContentView()
}
