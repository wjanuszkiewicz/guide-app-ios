import SwiftUI

struct ProfileView: View {
    @State private var showAuth = false
    @State private var uid: String? = FirebaseService.shared.currentUID

    var body: some View {
        VStack {
            // … Твой остальной интерфейс профиля …

            if let uid = uid {
                Text(String(format: NSLocalizedString("profile_uid", comment: ""), uid))
                    .padding(.bottom, 8)

                Button(NSLocalizedString("auth_sign_out", comment: "")) {
                    if FirebaseService.shared.signOut() {
                        self.uid = FirebaseService.shared.currentUID
                    }
                }
                .padding()
            } else {
                Button(NSLocalizedString("profile_sign_in", comment: "")) {
                showAuth = true
                }
                .padding()
            }
        }
        .fullScreenCover(isPresented: $showAuth) {
            OnboardingView(fromProfile: true)
        }
        .onAppear { uid = FirebaseService.shared.currentUID }
    }
}



