import CoreLocation
import Combine

/// Простейший синглтон, отдающий текущие координаты
final class LocationService: NSObject, ObservableObject, CLLocationManagerDelegate {
    static let shared = LocationService()        // ← используем в MapView

    @Published var location: CLLocation?

    private let manager = CLLocationManager()

    private override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    // delegate
    func locationManager(_ mgr: CLLocationManager,
                         didUpdateLocations locs: [CLLocation]) {
        location = locs.last
    }
}

