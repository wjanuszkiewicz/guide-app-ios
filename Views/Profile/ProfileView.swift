import SwiftUI

struct ProfileView: View {
    @State private var showAuth = false

    var body: some View {
        VStack {
            // … Твой остальной интерфейс профиля …

            Button("Войти / Зарегистрироваться") {
                showAuth = true
            }
            .padding()
        }
        .fullScreenCover(isPresented: $showAuth) {
            OnboardingView(fromProfile: true)
        }
    }
}



