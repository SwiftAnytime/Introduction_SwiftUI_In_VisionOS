//
//  ExploringVisionApp.swift
//  ExploringVision
//
//  Created by Thangddb on 20/01/2024.
//

import SwiftUI

@main
struct ExploringVisionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        WindowGroup(id: "new-window") {
            NewWindowView()
        }
    }
}
