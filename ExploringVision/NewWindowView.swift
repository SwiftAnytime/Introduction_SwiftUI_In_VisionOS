//
//  NewWindowView.swift
//  ExploringVision
//
//  Created by Thangddb on 21/01/2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct NewWindowView: View {
    @Environment(\.dismissWindow) private var dismissWindow
    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

            Text("Hello, world!")
            
            Button("Done") {
                dismissWindow(id: "new-window")
            }
        }
        .padding()
    }
}

#Preview {
    NewWindowView()
}
