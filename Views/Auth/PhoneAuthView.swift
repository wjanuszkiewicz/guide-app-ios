//
//  PhoneAuthView.swift
//  guide-app-ios
//
//  Created by Владислав Янушкевич on 17.05.25.
//

import SwiftUI
import FirebaseAuth

struct PhoneAuthView: View {
    @Environment(\.dismiss) var dismiss
    @State private var phoneNumber: String = ""
    @State private var verificationCode: String = ""
    @State private var verificationID: String?
    @State private var isLoading: Bool = false
    @State private var errorMessage: String?

    var body: some View {
        VStack(spacing: 16) {
            Text("auth_phone")

            TextField("+1 555 555 1234", text: $phoneNumber)
                .keyboardType(.phonePad)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)

            if let verificationID = verificationID {
                SecureField("123456", text: $verificationCode)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)

                Button(NSLocalizedString("auth_continue", comment: "")) { verifyCode(verificationID: verificationID) }
                    .buttonStyle(.borderedProminent)
            } else {
                Button(NSLocalizedString("auth_continue", comment: "")) { requestCode() }
                    .buttonStyle(.borderedProminent)
            }

            if isLoading { ProgressView(NSLocalizedString("auth_loading", comment: "")) }
            if let error = errorMessage { Text(error).foregroundColor(.red) }

            Button(NSLocalizedString("auth_back", comment: "")) { dismiss() }
                .padding(.top, 8)
        }
        .padding()
    }
}

private extension PhoneAuthView {
    func requestCode() {
        errorMessage = nil
        isLoading = true
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { id, error in
            isLoading = false
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                verificationID = id
            }
        }
    }

    func verifyCode(verificationID: String) {
        errorMessage = nil
        isLoading = true
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)

        if let user = Auth.auth().currentUser, user.isAnonymous {
            user.link(with: credential) { _, error in
                isLoading = false
                if let error = error {
                    errorMessage = error.localizedDescription
                } else {
                    UserDefaults.standard.set(true, forKey: "hasSeenAuth")
                    dismiss()
                }
            }
        } else {
            Auth.auth().signIn(with: credential) { _, error in
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
}

