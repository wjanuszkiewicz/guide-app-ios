//
//  AuthService.swift
//  guide-app-ios
//
//  Created by Владислав Янушкевич on 17.05.25.
//

import FirebaseAuth

final class AuthService {
    static let shared = AuthService()

    var user: User? {
        Auth.auth().currentUser
    }

    func linkWithCredential(_ credential: AuthCredential, completion: @escaping (Bool) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            completion(false)
            return
        }

        currentUser.link(with: credential) { result, error in
            completion(error == nil)
        }
    }
}
