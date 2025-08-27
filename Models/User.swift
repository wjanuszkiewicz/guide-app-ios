import Foundation

struct AppUser: Identifiable, Codable, Equatable {
    let id: String
    var email: String?
    var displayName: String?
    var isAnonymous: Bool
}
