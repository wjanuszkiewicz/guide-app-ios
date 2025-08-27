import Foundation
import CoreLocation

struct Place: Identifiable, Codable, Equatable {
    let id: String
    var title: String
    var subtitle: String?
    var coordinateLatitude: Double
    var coordinateLongitude: Double

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinateLatitude, longitude: coordinateLongitude)
    }
}
