import SwiftUI
import MapLibre

struct MapViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> MLNMapView {
        let systemLang = Locale.preferredLanguages.first ?? "ru"
        let langCode = String(systemLang.prefix(2))

        // Собираем ссылку с динамическим языком
        let urlStr = "https://api.maptiler.com/maps/streets-v2/style.json?key=op4lbldJRXZbcR7CZCRC&language=\(langCode)"
        let styleURL = URL(string: urlStr)!

        let mapView = MLNMapView(frame: .zero, styleURL: styleURL)
        mapView.setCenter(CLLocationCoordinate2D(latitude: 53.9, longitude: 27.566), zoomLevel: 11, animated: false)
        mapView.minimumZoomLevel = 4
        mapView.maximumZoomLevel = 17
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            mapView.showsUserLocation = true
        }
        return mapView
    }

    func updateUIView(_ uiView: MLNMapView, context: Context) {}
}


