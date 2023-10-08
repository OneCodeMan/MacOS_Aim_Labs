//
//  ShootingScreen.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-04.
//

import SwiftUI

struct GameView: View {
    @State var gameViewModel: GameViewModel
    @State var singleTargetPosition = CGPoint(x: 100, y: 100)
    @State var multipleTargetPositions: [CGPoint] = [CGPoint(x: 100, y: 100)]

    var body: some View {
        ZStack {
            gameViewModel.background.edgesIgnoringSafeArea(.all)
            
            switch gameViewModel.gameMode {
            case .singleFluctuatingTarget:
                TargetView(target: Target(hitpoints: gameViewModel.SINGLE_TARGET_HP)) {
                    generateNewTargetPosition()
                }
                .position(singleTargetPosition)
            case .multipleTargets, .ramboHeadshot:
                GeometryReader { geometry in
                   ZStack {
                       ForEach(0..<multipleTargetPositions.count, id: \.self) { i in
                           TargetView(target: Target(hitpoints: 99)) {
                               let newPosition = randomPosition(in: geometry.size)
                               multipleTargetPositions[i] = newPosition
                           }
                           .position(multipleTargetPositions[i])
                       }
                   }
               }
            case .headshotCity:
                TargetView(target: Target(hitpoints: gameViewModel.HEADSHOT_CITY_HP)) {
                    generateNewTargetPosition()
                }
                .position(singleTargetPosition)
            }

        } // ZStack
        .onTapGesture {
            gameViewModel.playShootingSound()
        }
        .onAppear {
            generateNewTargetPosition()
            print("GameView -- onAppear\n")
            print("Game Mode: \(gameViewModel.gameMode.description)")
            print("Selected Gun: \(gameViewModel.selectedGun.description)")
        }
    }
    
    private func generateNewTargetPosition() {
        switch gameViewModel.gameMode {
        case .singleFluctuatingTarget, .headshotCity:
            gameViewModel.generateNewTargetPosition()
            singleTargetPosition = gameViewModel.targetPosition
        case .multipleTargets, .ramboHeadshot:
            gameViewModel.generateNewTargetPositions()
            multipleTargetPositions = gameViewModel.targetPositions
        }
        
    }
    
    // Generate a random non-overlapping position for a circle
    private func randomPosition(in size: CGSize) -> CGPoint {
        var position: CGPoint
        var isOverlapping: Bool
        let circleSize: CGFloat = 40.0
        let padding: CGFloat = 20.0
        
        repeat {
            position = CGPoint(
                x: CGFloat.random(in: gameViewModel.MIN_X...gameViewModel.MAX_X),
                y: CGFloat.random(in: gameViewModel.MIN_Y...gameViewModel.MAX_Y)
            )
            
            // Check for overlaps with existing circles
            isOverlapping = false
            for existingCircle in 0..<multipleTargetPositions.count {
                let existingPosition = multipleTargetPositions[existingCircle]
                let distance = sqrt(pow(position.x - existingPosition.x, 2) + pow(position.y - existingPosition.y, 2))
                if distance < (circleSize + padding) {
                    isOverlapping = true
                    break
                }
            }
        } while isOverlapping
        
        return position
    }
}

#Preview {
    GameView(gameViewModel: GameViewModel(gameMode: .headshotCity, selectedGun: .deagleDiva))
}
