//
//  GameViewModel.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-05.
//

import Foundation
import SwiftUI
import CGExtender

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
    
    // MARK: Positioning
    
    // For single targets
    func generateNewTargetPosition() {
        switch gameMode {
        case .singleFluctuatingTarget, .multipleTargets:
            self.targetPosition = self.randomPosition()
        case .headshotCity, .ramboHeadshot:
            let randomX = CGFloat.random(in: MIN_X..<MAX_X)
            self.targetPosition = CGPoint(x: randomX, y: FIXED_Y)
        }
    }
    
    func generateNewTargetPosition(for index: Int) {
        self.targetPositions[index] = self.randomPosition()
    }
    
    // For multiple targets, initially
    func generateNewTargetPositions() {
        switch gameMode {
        case .multipleTargets: // FIXME: Collision detection
            var newTargetPositions = [CGPoint]()
            for _ in 1...MAX_TARGETS_MULTIPLE {
                let randomPoint = self.randomPosition(currentPositions: newTargetPositions)
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
    
    // Generate a random non-overlapping position for a circle
    // Size is: (1470.0, 920.0)
    func randomPosition(in size: CGSize = CGSize(width: 1470.0, height: 920.0), currentPositions: [CGPoint]? = nil) -> CGPoint {
        var position: CGPoint
        var isOverlapping: Bool
        let circleSize: CGFloat = 40.0
        let padding: CGFloat = 30.0
        
        let currentArray = currentPositions == nil ? self.targetPositions : currentPositions
        guard let positions = currentArray else { return CGPoint(x: 0, y: 0) }
        
        repeat {
            position = CGPoint(
                x: CGFloat.random(in: self.MIN_X...self.MAX_X),
                y: CGFloat.random(in: self.MIN_Y...self.MAX_Y)
            )
            
            // Check for overlaps with existing circles
            isOverlapping = false
            for existingCircle in 0..<positions.count {
                let existingPosition = positions[existingCircle]
                let distance = sqrt(pow(position.x - existingPosition.x, 2) + pow(position.y - existingPosition.y, 2))
                if distance < (circleSize + padding) {
                    isOverlapping = true
                    break
                }
            }
        } while isOverlapping
        
        return position
    }
    
    // MARK: Audio
    
    func playShootingSound() {
        Sounds.playSounds(soundfile: self.gunSound)
    }
}
