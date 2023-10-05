//
//  StartView.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-05.
//

import SwiftUI

struct StartView: View {
    @State var selectedGameMode: GameMode = .headshotCity
    @State var selectedGun: SelectedGun = .teamGlock
    @State var gameInProgress = false
    @State var musicPlaying = true
    
    var body: some View {
        Group {
            if gameInProgress {
                GameView()
            } else {
                MenuView(selectedGameMode: $selectedGameMode, selectedGun: $selectedGun, gameInProgress: $gameInProgress, musicPlaying: $musicPlaying)
            }
            
        } // Group
        .onAppear(perform: {
            if musicPlaying {
                Sounds.playSounds(soundfile: Constants.ThemeMusic.rings)
            }
        })
        
    }
}

#Preview {
    StartView()
}
