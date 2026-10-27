import UIKit
import AVFoundation

final class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!

    private let tracks = TrackLibrary.tracks
    private var currentIndex = 0
    private var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        try? AVAudioSession.sharedInstance().setCategory(.playback)
        try? AVAudioSession.sharedInstance().setActive(true)

        loadTrack(at: 0, autoplay: false)
    }

   
    private func loadTrack(at index: Int, autoplay: Bool) {
        currentIndex = index
        let track = tracks[index]

        let name = (track.fileName as NSString).deletingPathExtension
        let ext = (track.fileName as NSString).pathExtension

        player?.stop()
        player = nil

        if let url = Bundle.main.url(forResource: name, withExtension: ext) {
            do {
                let newPlayer = try AVAudioPlayer(contentsOf: url)
                newPlayer.delegate = self
                newPlayer.prepareToPlay()
                player = newPlayer
                if autoplay {
                    newPlayer.play()
                }
            } catch {
                print("Не удалось открыть \(track.fileName): \(error)")
            }
        } else {
            print("Файл не найден: \(track.fileName)")
        }

        updateUI()
    }

    private func updateUI() {
        let track = tracks[currentIndex]
        titleLabel.text = track.title
        artistLabel.text = track.artist
        coverImageView.image = UIImage(named: track.coverImageName)

        let isPlaying = player?.isPlaying ?? false
        let iconName = isPlaying ? "pause.fill" : "play.fill"
        playPauseButton.setImage(UIImage(systemName: iconName), for: .normal)
    }

    @IBAction func playPauseTapped(_ sender: UIButton) {
        guard let player = player else {
            print("Плеер не загружен")
            return
        }
        if player.isPlaying {
            player.pause()
        } else {
            player.play()
        }
        updateUI()
    }

    @IBAction func nextTapped(_ sender: UIButton) {
        let wasPlaying = player?.isPlaying ?? false
        let next = (currentIndex + 1) % tracks.count
        loadTrack(at: next, autoplay: wasPlaying)
    }

    @IBAction func previousTapped(_ sender: UIButton) {
        let wasPlaying = player?.isPlaying ?? false
        let prev = (currentIndex - 1 + tracks.count) % tracks.count
        loadTrack(at: prev, autoplay: wasPlaying)
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        let next = (currentIndex + 1) % tracks.count
        loadTrack(at: next, autoplay: true)
    }
}
