import SwiftUI

// MARK: - Цвет из HEX (один раз в проекте)
extension Color {
    init(hex: UInt32, alpha: Double = 1) {
        self.init(
            .sRGB,
            red:   Double((hex & 0xFF0000) >> 16) / 255,
            green: Double((hex & 0x00FF00) >>  8) / 255,
            blue:  Double( hex & 0x0000FF       ) / 255,
            opacity: alpha
        )
    }
}

// MARK: - Перечисление всех вкладок
enum Tab: Hashable {
    case home, map, tours, profile

    var title: String {
        switch self {
        case .home:    return "Главная"
        case .map:     return "Карта"
        case .tours:   return "Экскурсии"
        case .profile: return "Профиль"
        }
    }

    /// SF-Symbols, доступные с iOS 13
    var systemImage: String {
        switch self {
        case .home:    return "house.fill"
        case .map:     return "map.fill"
        case .tours:   return "figure.walk"
        case .profile: return "person.crop.circle"
        }
    }
}

// MARK: - Основной TabBar
struct TabBarView: View {
    @State private var selection: Tab = .home

    var body: some View {
        TabView(selection: $selection) {

            // ── 1. Главная
            HomeView()
                .tabItem { Label(Tab.home.title, systemImage: Tab.home.systemImage) }
                .tag(Tab.home)

            // ── 2. Карта
            MapScreen()
                .tabItem { Label(Tab.map.title, systemImage: Tab.map.systemImage) }
                .tag(Tab.map)

            // ── 3. Экскурсии
            ToursView()
                .tabItem { Label(Tab.tours.title, systemImage: Tab.tours.systemImage) }
                .tag(Tab.tours)

            // ── 4. Профиль
            ProfileView()
                .tabItem { Label(Tab.profile.title, systemImage: Tab.profile.systemImage) }
                .tag(Tab.profile)
        }
        // цвет активной вкладки
        .tint(Color(hex: 0x1A73E8))

        // цвет неактивных
        .onAppear {
            UITabBar.appearance().unselectedItemTintColor = UIColor(
                red: 0x9E/255, green: 0x9E/255, blue: 0x9E/255, alpha: 1
            )
        }
    }
}
