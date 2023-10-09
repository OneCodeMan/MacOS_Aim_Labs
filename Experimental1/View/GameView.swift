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
    
    @State private var hover: Bool = false

    var body: some View {
        ZStack {
            gameViewModel.background.edgesIgnoringSafeArea(.all)
            
            switch gameViewModel.gameMode {
            case .singleFluctuatingTarget:
                TargetView(target: Target(hitpoints: gameViewModel.SINGLE_TARGET_HP)) {
                    generateNewTargetPosition()
                }
                .position(singleTargetPosition)
            case .multipleTargets:
                GeometryReader { geometry in
                    ZStack {
                        ForEach(0..<multipleTargetPositions.count, id: \.self) { i in
                            TargetView(target: Target(hitpoints: 99)) {
                                gameViewModel.generateNewTargetPosition(for: i)
                                multipleTargetPositions[i] = gameViewModel.targetPositions[i]
                            }
                            .position(multipleTargetPositions[i])
                        }
                    }
                }
            case .ramboHeadshot:
                ForEach(0..<multipleTargetPositions.count, id: \.self) { i in
                    TargetView(target: Target(hitpoints: 99)) {
                        gameViewModel.generateNewTargetPosition()
                        multipleTargetPositions[i] = gameViewModel.targetPosition
                    }
                    .position(multipleTargetPositions[i])
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
            NSCursor.crosshair.push()
        }
        .onAppear {
            generateNewTargetPosition()
            print("GameView -- onAppear\n")
            print("Game Mode: \(gameViewModel.gameMode.description)")
            print("Selected Gun: \(gameViewModel.selectedGun.description)")
        }
        .onHover(perform: { hovering in
            self.hover = hovering
            DispatchQueue.main.async {
                if (self.hover) {
                    NSCursor.crosshair.push()
                } else {
                    NSCursor.pop()
                }
            }
        })
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
}

#Preview {
    GameView(gameViewModel: GameViewModel(gameMode: .headshotCity, selectedGun: .deagleDiva))
}
