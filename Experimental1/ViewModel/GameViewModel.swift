//
//  GameViewModel.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-05.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    let background = Color.blue
    
    // TODO: I feel like these should be in a class of their own.

    // MARK: Single target
    let MIN_X: CGFloat = 300.0
    let MAX_X: CGFloat = 800.0
    let MIN_Y: CGFloat = 300.0
    let MAX_Y: CGFloat = 700.0
    let SINGLE_TARGET_HP = 99
    
    // MARK: Headshot city
    let FIXED_Y: CGFloat = 500.0
    let HEADSHOT_CITY_HP = 99
    
    // Other stuff
    
    @Published var targetPosition = CGPoint(x: 100, y: 100)
    
    var gameMode: GameMode
    var selectedGun: SelectedGun
    var gunSound: String = Constants.ShootingSound.deagleSoundString
    
    init(targetPosition: CGPoint = CGPoint(x: 100, y: 100), gameMode: GameMode, selectedGun: SelectedGun) {
        self.targetPosition = targetPosition
        self.gameMode = gameMode
        self.selectedGun = selectedGun
        
        switch selectedGun {
        case .teamGlock:
            self.gunSound = Constants.ShootingSound.glockSoundString
        case .deagleDiva:
            self.gunSound = Constants.ShootingSound.deagleSoundString
        case .m1Shooter:
            self.gunSound = Constants.ShootingSound.m1911SoundString
        }
    }
    
    func generateNewTargetPosition() {
        
        if gameMode == .singleFluctuatingTarget {
            let randomX = CGFloat.random(in: MIN_X..<MAX_X)
            let randomY = CGFloat.random(in: MIN_Y..<MAX_Y)
            self.targetPosition = CGPoint(x: randomX, y: randomY)
        } else if gameMode == .headshotCity {
            let randomX = CGFloat.random(in: MIN_X..<MAX_X)
            self.targetPosition = CGPoint(x: randomX, y: FIXED_Y)
        }
       
    }
    
    func playShootingSound() {
        Sounds.playSounds(soundfile: self.gunSound)
    }
}
