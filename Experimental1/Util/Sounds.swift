//
//  Sounds.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-05.
//

import Foundation
import AVFoundation

class Sounds {
    
    static var audioPlayer: AVAudioPlayer?
    
    static func playSounds(soundfile: String) {
        
        if let path = Bundle.main.path(forResource: soundfile, ofType: nil) {
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
                
            } catch {
                print("Error with Sounds. Trying to play file: \(soundfile)")
            }
        }
    }
}
