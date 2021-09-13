//
//  StandartSound.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 10.09.2021.
//

import Foundation
import AVFoundation

enum NameSound: String {
    case openController = "open controller"
    case closeController = "close controller"
    case tapButton = "tap button"
}
    
private var player: AVAudioPlayer = AVAudioPlayer()

func playSound(name: NameSound) {
    
    player.stop()
    
    if defaultUser.personalSetting.sound {
        
        guard let url = Bundle.main.url(forResource: name.rawValue, withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            player.play()

        } catch let error {
            debugPrint(error.localizedDescription)
        }
    }
}
