//
//  OnboardingViewModel.swift
//  guide-app-ios
//
//  Created by Владислав Янушкевич on 17.05.25.
//

import Foundation
import FirebaseAuth
import AuthenticationServices

class OnboardingViewModel: ObservableObject {
    @Published var showEmail = false
    @Published var showPhone = false

    func signInAnonymously() {
        if let user = Auth.auth().currentUser, user.isAnonymous {
            user.reload { error in
                if let error = error {
                    print(NSLocalizedString("auth_reload_failed", comment: "") + ": \(error.localizedDescription)")
                    try? Auth.auth().signOut()
                    self.performAnonymousSignIn()
                } else {
                    print(NSLocalizedString("auth_already_signed", comment: "") + ": \(user.uid)")
                    UserDefaults.standard.set(true, forKey: "hasSeenAuth")
                }
            }
        } else {
            performAnonymousSignIn()
        }
    }

    private func performAnonymousSignIn() {
        Auth.auth().signInAnonymously { result, error in
            if let error = error {
                print(NSLocalizedString("auth_error", comment: "") + ": \(error.localizedDescription)")
            } else if let uid = result?.user.uid {
                print(NSLocalizedString("auth_success", comment: "") + ": \(uid)")
                UserDefaults.standard.set(true, forKey: "hasSeenAuth")
            }
        }
    }

    func signInWithGoogle() {
        // TODO: Реализовать Google Sign-In
    }

    func handleAppleRequest(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
    }

    func handleAppleResult(_ result: Result<ASAuthorization, Error>) {
        // TODO: Обработка результата Apple Sign-In
    }
}

