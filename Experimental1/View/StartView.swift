//
//  StartView.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-05.
//

import SwiftUI

struct StartView: View {
    @State var gameInProgress = false
    
    var body: some View {
        Group {
            if gameInProgress {
                GameView()
            } else {
                VStack {
                    Text("MacOS Aim Labs")
                    Text("GAME MODE")

                    // Button group here
                    
                    Text("GUN")
                    
                    // Button group here
                    
                    Button {
                        gameInProgress.toggle()
                    } label: {
                        Text("LET'S PLAY!!")
                    }
                    .buttonStyle(.borderedProminent)

                } // VStack
            }
            
        }
        
    }
}

#Preview {
    StartView()
}
