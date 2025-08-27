//
//  EmailAuthView.swift
//  guide-app-ios
//
//  Created by Владислав Янушкевич on 17.05.25.
//

import SwiftUI
import FirebaseAuth

struct EmailAuthView: View {
    @Environment(\.dismiss) var dismiss
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoading: Bool = false
    @State private var errorMessage: String?

    var body: some View {
        VStack(spacing: 16) {
            Text("auth_email")

            TextField("Email", text: $email)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)

            SecureField("Password", text: $password)
                .textContentType(.password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)

            if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }

            if isLoading {
                ProgressView(NSLocalizedString("auth_loading", comment: ""))
            }

            HStack {
                Button(NSLocalizedString("auth_continue", comment: "")) {
                    signIn()
                }
                .buttonStyle(.borderedProminent)

                Button("Sign up") {
                    signUp()
                }
                .buttonStyle(.bordered)
            }

            Button(NSLocalizedString("auth_back", comment: "")) { dismiss() }
                .padding(.top, 8)
        }
        .padding()
    }
}

private extension EmailAuthView {
    func signIn() {
        errorMessage = nil
        isLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            isLoading = false
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                UserDefaults.standard.set(true, forKey: "hasSeenAuth")
                dismiss()
            }
        }
    }

    func signUp() {
        errorMessage = nil
        isLoading = true
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            isLoading = false
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                UserDefaults.standard.set(true, forKey: "hasSeenAuth")
                dismiss()
            }
        }
    }
}

