//
//  ShootingScreen.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-04.
//

import SwiftUI

struct StartScreenView: View {
    
    @State private var targetPosition = CGPoint(x: 100, y: 100)

    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            
            TargetView(target: Target()) {
                let randomX = CGFloat.random(in: 300..<800)
                let randomY = CGFloat.random(in: 300..<700)
                
                targetPosition = CGPoint(x: randomX, y: randomY)
            }
            .position(targetPosition)
        }
    }
}

#Preview {
    StartScreenView()
}
