import SwiftUI
struct HomeView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Добро пожаловать!")
            Text(Bundle.main.preferredLocalizations.first ?? "Нет языка")
                .font(.title)
            Image(systemName: "sparkles")
                .font(.system(size: 40))
                .foregroundColor(.accentColor)
        }
    }
}



