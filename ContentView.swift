//
//  ContentView.swift
//  guide-app-ios
//
//  Created by Владислав Янушкевич on 12.05.25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasSeenAuth") private var hasSeenAuth = false

    var body: some View {
        TabBarView()
            .preferredColorScheme(.light)
            .fullScreenCover(isPresented: .constant(!hasSeenAuth)) {
                OnboardingView()
            }
    }
}

#Preview {
    ContentView()
}

