//
//  ShootingScreen.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-04.
//

import SwiftUI

struct GameView: View {
    
    @State private var targetPosition = CGPoint(x: 100, y: 100)
    @State var gameViewModel = GameViewModel()

    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            
            TargetView(target: Target()) {
                
                targetPosition = gameViewModel.generateNewTargetPosition()
            }
            .position(targetPosition)
        }
    }
}

#Preview {
    GameView()
}
