//
//  NavigationExample.swift
//  ExploringVision
//
//  Created by Thangddb on 21/01/2024.
//

import SwiftUI

struct NavigationExample: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct DetailView: View {
    let title: String

    var body: some View {
        Text("Detail view for \(title)")
            .navigationTitle(title)
    }
}

#Preview {
    NavigationExample()
}
