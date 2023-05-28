//
//  SoundPlayer.swift
//  ADTChallenge
//
//  Created by Eric Freitas on 5/27/23.
//

import Foundation
import AVFoundation

struct Sounds {
    var soundEffect: AVAudioPlayer!
    var burpNames = ["burp1", "burp2", "burp3", "burp4", "burp5", "burp6"]
    
    mutating func playRandom() {
        let indexToPlay = Int.random(in: 0..<burpNames.count)
        if let path = Bundle.main.path(forResource: burpNames[indexToPlay], ofType: "mp3") {
            let url = URL.init(filePath: path)
            do {
                soundEffect = try AVAudioPlayer(contentsOf: url)
                soundEffect.currentTime = 0
                soundEffect.play()
            } catch {
                print("Could not load sound file!")
            }
        }
    }
}
