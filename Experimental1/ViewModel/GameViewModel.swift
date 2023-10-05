//
//  GameViewModel.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-05.
//

import Foundation

class GameViewModel: ObservableObject {
    let MIN_X: CGFloat = 300.0
    let MAX_X: CGFloat = 800.0
    let MIN_Y: CGFloat = 300.0
    let MAX_Y: CGFloat = 700.0
    
    @Published var targetPosition = CGPoint(x: 100, y: 100)
    
    let gameMode: GameMode = .singleFluctuatingTarget
    
    func generateNewTargetPosition() {
        let randomX = CGFloat.random(in: MIN_X..<MAX_X)
        let randomY = CGFloat.random(in: MIN_Y..<MAX_Y)
        
        self.targetPosition = CGPoint(x: randomX, y: randomY)
        print("ViewModel targetPosition: \(self.targetPosition)")
    }
    
    func playShootingSound() {
        Sounds.playSounds(soundfile: Constants.TargetHitSounds.deagleSoundString)
    }
}
