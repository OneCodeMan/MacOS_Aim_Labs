//
//  ShootingScreen.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-04.
//

import SwiftUI

struct GameView: View {
    
    @State var gameViewModel = GameViewModel()
    @State var targetPosition = CGPoint(x: 100, y: 100)

    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            
            TargetView(target: Target()) {
                gameViewModel.generateNewTargetPosition()
                targetPosition = gameViewModel.targetPosition
            }
            .position(targetPosition)
            .onTapGesture {
                gameViewModel.playShootingSound()
            }
        }
    }
}

#Preview {
    GameView()
}
