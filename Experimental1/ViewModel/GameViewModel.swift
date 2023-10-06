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
    // SingleTargetClass(), MultipleTargetClass(), etc.

    // MARK: Single target
    let MIN_X: CGFloat = 300.0
    let MAX_X: CGFloat = 800.0
    let MIN_Y: CGFloat = 300.0
    let MAX_Y: CGFloat = 700.0
    let SINGLE_TARGET_HP = 99
    
    // MARK: Headshot city
    let FIXED_Y: CGFloat = 500.0
    let HEADSHOT_CITY_HP = 99
    
    @Published var targetPosition = CGPoint(x: 100, y: 100)
    
    // MARK: Multiple targets
    let MAX_TARGETS_MULTIPLE = 10
    @Published var targetPositions = [CGPoint(x: 350, y: 500), CGPoint(x: 520, y: 230), CGPoint(x: 420, y: 569)]
    
    // MARK: Rambo headshot
    let MAX_TARGETS_HEADSHOT_RAMBO = 4
    
    // Other stuff
    
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
    
    // For single targets
    func generateNewTargetPosition() {
        
        switch gameMode {
        case .singleFluctuatingTarget, .multipleTargets:
            let randomX = CGFloat.random(in: MIN_X..<MAX_X)
            let randomY = CGFloat.random(in: MIN_Y..<MAX_Y)
            self.targetPosition = CGPoint(x: randomX, y: randomY)
        case .headshotCity, .ramboHeadshot:
            let randomX = CGFloat.random(in: MIN_X..<MAX_X)
            self.targetPosition = CGPoint(x: randomX, y: FIXED_Y)
        }
    }
    
    // For multiple targets, initially
    func generateNewTargetPositions() {
        switch gameMode {
        case .multipleTargets: // FIXME
            var newTargetPositions = [CGPoint]()
            for _ in 1...MAX_TARGETS_MULTIPLE {
                let randomX = CGFloat.random(in: MIN_X..<MAX_X)
                let randomY = CGFloat.random(in: MIN_Y..<MAX_Y)
                let randomPoint = CGPoint(x: randomX, y: randomY)
                newTargetPositions.append(randomPoint)
            }
            self.targetPositions = newTargetPositions
        case .ramboHeadshot:
            var newTargetPositions = [CGPoint]()
            for _ in 1...MAX_TARGETS_HEADSHOT_RAMBO {
                let randomX = CGFloat.random(in: MIN_X..<MAX_X)
                let randomPoint = CGPoint(x: randomX, y: FIXED_Y)
                newTargetPositions.append(randomPoint)
            }
            self.targetPositions = newTargetPositions
        case .singleFluctuatingTarget, .headshotCity:
            break

        }
    }
    
    func playShootingSound() {
        Sounds.playSounds(soundfile: self.gunSound)
    }
}
