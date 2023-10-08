//
//  SoundViewModel.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-08.
//

import Foundation
import AVFoundation

class SoundViewModel: ObservableObject {
    
    var audioPlayer: AVAudioPlayer?
    
    func playSound(soundfile: String) {
        
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
    
    func stopSound() {
        audioPlayer?.stop()
    }
    
}
