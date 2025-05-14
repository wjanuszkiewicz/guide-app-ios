import SwiftUI

// MARK: - Цвета
struct AppColors {
    static let activeTab = Color(hex: "#1A73E8")
    static let inactiveTab = Color(hex: "#9E9E9E")
    static let background = Color.white
    static let textPrimary = Color.black
    static let textSecondary = Color.gray
    static let cardBackground = Color(UIColor.systemGray6)
}

// MARK: - Шрифты
struct AppFont {
    static let title = Font.system(size: 20, weight: .semibold)
    static let body = Font.system(size: 16)
    static let caption = Font.system(size: 14)
}

// MARK: - Отступы
struct AppSpacing {
    static let small: CGFloat = 8
    static let medium: CGFloat = 16
    static let large: CGFloat = 24
}

// MARK: - Радиусы
struct AppRadius {
    static let card: CGFloat = 16
    static let button: CGFloat = 12
}

