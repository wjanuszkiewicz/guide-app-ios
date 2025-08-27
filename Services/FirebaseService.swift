import Foundation
import FirebaseAuth

final class FirebaseService {
    static let shared = FirebaseService()

    private init() {}

    var currentUID: String? {
        Auth.auth().currentUser?.uid
    }

    var isAnonymous: Bool {
        Auth.auth().currentUser?.isAnonymous ?? true
    }

    func signOut() -> Bool {
        do {
            try Auth.auth().signOut()
            return true
        } catch {
            print("Sign out error: \(error.localizedDescription)")
            return false
        }
    }
}
