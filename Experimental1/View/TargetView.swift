//
//  TargetView.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-05.
//

import SwiftUI

struct TargetView: View {
    @State var targetHitpoints: Int = 1
    @State var targetDestroyed = false
    var target: Target
    
    var handlePosition: () -> Void

    var body: some View {
        Circle()
            .fill(target.colour)
            .frame(width: target.width, height: target.height)
            .onTapGesture {
        
                if targetHitpoints > 1 {
                    targetHitpoints -= 1
                    handlePosition()
                } else {
                    Sounds.playSounds(soundfile: target.destroySound)
                    targetDestroyed.toggle()
                }
            }
            .hidden(targetDestroyed)
            .onAppear(perform: {
                self.targetHitpoints = target.hitpoints
            })
    }
}
