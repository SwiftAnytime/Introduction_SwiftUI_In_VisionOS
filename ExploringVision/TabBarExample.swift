//
//  TabBarExample.swift
//  ExploringVision
//
//  Created by Thangddb on 21/01/2024.
//

import SwiftUI

struct TabBarExample: View {
    
    @Environment(\.openWindow) var openWindow
    @Environment(\.supportsMultipleWindows) private var supportsMultipleWindows
    
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
        .ornament(
            visibility: .visible,
            attachmentAnchor: .scene(.bottom),
            contentAlignment: .bottom) {
                Button {
                    print("Open New Window")
                    openWindow(id: "new-window")
                } label: {
                    Text("Open New Window")
                        .padding()
                }
                .glassBackgroundEffect(
                    in: RoundedRectangle(
                        cornerRadius: 32,
                        style: .continuous
                    )
                )
                .opacity(supportsMultipleWindows ? 1 : 0)
            }
    }
}

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Home Tab")
                    .font(.largeTitle)
                NavigationLink("Go to Detail", value: "HomeDetail")
                    .navigationDestination(for: String.self) { identifier in
                        if identifier == "HomeDetail" {
                            Text("Home Detail View")
                        }
                    }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button("Option 1") { print("Home Option 1") }
                        Button("Option 2") { print("Home Option 2") }
                        Button("Option 3") { print("Home Option 3") }
                    } label: {
                        Label("Menu", systemImage: "ellipsis.circle")
                    }
                }
            }
        }
    }
}

struct SearchView: View {
    @State var showSheet = false
    @State var showSecondSheet = false
    
    var body: some View {
        VStack {
            Text("Search Tab")
                .font(.largeTitle)
            
            Button {
                showSheet.toggle()
            } label: {
                Text("Present Sheet")
            }
        }
        .sheet(isPresented: $showSheet) {
            VStack {
                Button {
                    showSecondSheet.toggle()
                } label: {
                    Text("Present Another Sheet")
                }
            
                Button {
                    showSheet.toggle()
                } label: {
                    Text("Close Sheet")
                }
            }
            .padding(50)
            .sheet(isPresented: $showSecondSheet) {
                VStack {
                    Text("Sheet Number 2")
                
                    Button {
                        showSecondSheet.toggle()
                    } label: {
                        Text("Close Sheet")
                    }
                }
                .padding(50)
            }
        }
    }
}

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Settings Tab")
                    .font(.largeTitle)
                NavigationLink("Go to Detail", value: "SettingsDetail")
                    .navigationDestination(for: String.self) { identifier in
                        if identifier == "SettingsDetail" {
                            Text("Settings Detail View")
                        }
                    }
            }
        }
    }
}

#Preview {
    TabBarExample()
}
