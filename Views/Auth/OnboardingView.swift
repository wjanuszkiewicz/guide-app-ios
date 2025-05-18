//
//  OnboardingView.swift
//  guide-app-ios
//
//  Created by Владислав Янушкевич on 17.05.25.
//

import SwiftUI
import FirebaseAuth
import AuthenticationServices

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    @Environment(\.dismiss) var dismiss
    
    var fromProfile: Bool = false

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.2), Color.white]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 24) {
                Spacer().frame(height: 60)
                
                VStack(spacing: 10) {
                    Text("auth_title")
                        .font(.title2.bold())
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Text("auth_description")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                }
                
                Spacer()

                VStack(spacing: 14) {
                    AuthButton(title: "auth_email", systemImage: "envelope.fill") {
                        viewModel.showEmail = true
                    }
                    
                    AuthButton(title: "auth_google", systemImage: "globe") {
                        viewModel.signInWithGoogle()
                    }
                    
#if os(iOS)
                    SignInWithAppleButtonView()
#endif
                    
                    AuthButton(title: "auth_phone", systemImage: "phone.fill") {
                        viewModel.showPhone = true
                    }

                    if !fromProfile {
                        AuthButton(title: "auth_skip", systemImage: "lock.open.fill") {
                            viewModel.signInAnonymously()
                        }
                        .foregroundColor(.gray)
                    }
                }

                Spacer()
            }
            .padding(.bottom)
            .fullScreenCover(isPresented: $viewModel.showEmail) {
                EmailAuthView()
            }
            .fullScreenCover(isPresented: $viewModel.showPhone) {
                PhoneAuthView()
            }
            .overlay(alignment: .topLeading) {
                if fromProfile {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                            .padding(12)
                            .background(Color.white.opacity(0.9))
                            .clipShape(Circle())
                            .accessibilityLabel(Text("auth_back"))
                    }
                    .padding()
                }
            }
        }
    }
}

