//
//  SignInWithAppleButtonView.swift
//  guide-app-ios
//
//  Created by Владислав Янушкевич on 17.05.25.
//

import SwiftUI
import AuthenticationServices

struct SignInWithAppleButtonView: View {
    var body: some View {
        HStack {
            SignInWithAppleButton(
                .signIn,
                onRequest: { request in
                    request.requestedScopes = [.fullName, .email]
                },
                onCompletion: { _ in
                    guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                          let window = scene.windows.first else { return }

                    AppleAuthHelper.shared.startSignInWithAppleFlow(anchor: window) { success in
                        if success {
                            UserDefaults.standard.set(true, forKey: "hasSeenAuth")
                        }
                    }
                }
            )
            .signInWithAppleButtonStyle(.black)
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .cornerRadius(8)
        }
        .padding(.horizontal)
    }
}

