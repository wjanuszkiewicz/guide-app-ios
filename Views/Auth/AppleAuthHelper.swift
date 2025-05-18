//
//  AppleAuthHelper.swift
//  guide-app-ios
//
//  Created by Владислав Янушкевич on 17.05.25.
//

import Foundation
import AuthenticationServices
import FirebaseAuth
import SwiftUI

final class AppleAuthHelper: NSObject {
    static let shared = AppleAuthHelper()

    private override init() {}

    private var authCompletion: ((Bool) -> Void)?

    func startSignInWithAppleFlow(anchor: ASPresentationAnchor, completion: @escaping (Bool) -> Void) {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self

        self.anchorWindow = anchor
        self.authCompletion = completion
        controller.performRequests()
    }

    private var anchorWindow: ASPresentationAnchor?
}

extension AppleAuthHelper: ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return anchorWindow ?? ASPresentationAnchor()
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential else {
            authCompletion?(false)
            return
        }

        guard let tokenData = credential.identityToken,
              let tokenString = String(data: tokenData, encoding: .utf8) else {
            authCompletion?(false)
            return
        }

        let firebaseCredential = OAuthProvider.credential(
            providerID: AuthProviderID.apple,
            idToken: tokenString,
            rawNonce: UUID().uuidString,
            accessToken: nil
        )
        if let user = Auth.auth().currentUser, user.isAnonymous {
            user.link(with: firebaseCredential) { _, error in
                self.authCompletion?(error == nil)
            }
        } else {
            Auth.auth().signIn(with: firebaseCredential) { _, error in
                self.authCompletion?(error == nil)
            }
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("❌ Apple sign-in error: \(error.localizedDescription)")
        authCompletion?(false)
    }
}

