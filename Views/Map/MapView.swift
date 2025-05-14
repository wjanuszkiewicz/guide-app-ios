import SwiftUI
import MapLibre            // именно MapLibre для CocoaPods

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MLNMapView {
        let styleURL = URL(string: "https://basemaps.cartocdn.com/gl/voyager-gl-style/style.json")!
        let mv = MLNMapView(frame: .zero, styleURL: styleURL)
        mv.setCenter(.init(latitude: 53.9, longitude: 27.566),
                     zoomLevel: 11, animated: false)
        return mv
    }
    func updateUIView(_ uiView: MLNMapView, context: Context) { }
}




