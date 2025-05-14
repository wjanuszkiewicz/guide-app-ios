import SwiftUI
struct HomeView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Добро пожаловать!")
                .font(.title)
            Image(systemName: "sparkles")
                .font(.system(size: 40))
                .foregroundColor(.accentColor)
        }
    }
}


