//
//  ShootingScreen.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-04.
//

import SwiftUI

struct GameView: View {
    @State var gameViewModel: GameViewModel
    @State var targetPosition = CGPoint(x: 100, y: 100)

    var body: some View {
        ZStack {
            gameViewModel.background.edgesIgnoringSafeArea(.all)
            
            switch gameViewModel.gameMode {
            case .singleFluctuatingTarget:
                TargetView(target: Target(hitpoints: gameViewModel.SINGLE_TARGET_HP)) {
                    generateNewTargetPosition()
                }
                .position(targetPosition)
            case .multipleTargets:
                TargetView(target: Target()) {
                    generateNewTargetPosition()
                }
            case .headshotCity:
                TargetView(target: Target(hitpoints: gameViewModel.HEADSHOT_CITY_HP)) {
                    generateNewTargetPosition()
                }
                .position(targetPosition)
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
        gameViewModel.generateNewTargetPosition()
        targetPosition = gameViewModel.targetPosition
    }
}

#Preview {
    GameView(gameViewModel: GameViewModel(gameMode: .headshotCity, selectedGun: .deagleDiva))
}
