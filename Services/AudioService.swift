import AVFoundation
import Foundation

final class AudioService: NSObject {
    static let shared = AudioService()

    private var player: AVAudioPlayer?

    func play(url: URL) {
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("Audio play error: \(error.localizedDescription)")
        }
    }

    func stop() {
        player?.stop()
    }
}
