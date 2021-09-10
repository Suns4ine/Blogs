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
    
    
    if defaultUser.personalSetting.sound {
        
        guard let url = Bundle.main.url(forResource: name.rawValue, withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

           // guard let player = player else { return }

            player.play()

        } catch let error {
            debugPrint(error.localizedDescription)
        }
    }
}
