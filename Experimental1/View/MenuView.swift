//
//  MenuView.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-05.
//

import SwiftUI

struct MenuView: View {
    @Binding var selectedGameMode: GameMode
    @Binding var selectedGun: SelectedGun
    @Binding var gameInProgress: Bool
    @Binding var musicPlaying: Bool
    
    var body: some View {
        VStack {
            Text("MacOS Aim Labs")
                .font(Font.custom("ARCADE_I.tff", size: 70))
                .padding()
            
            Text("GAME MODE")
                .font(Font.custom("ARCADE_I.tff", size: 50))
            
            // Button group here
            HStack {
                Button {
                    self.selectedGameMode = .headshotCity
                } label: {
                    Text("HEADSHOT CITY")
                }
                .buttonStyle(OptionButtonStyle(isSelected: self.selectedGameMode == .headshotCity))
                
                Button {
                    self.selectedGameMode = .singleFluctuatingTarget
                    Sounds.playSounds(soundfile: Constants.MenuSounds.genericMenuItemSelectString)
                } label: {
                    Text("SINGLE FLUCTUATING")
                }
                .buttonStyle(OptionButtonStyle(isSelected: self.selectedGameMode == .singleFluctuatingTarget))
                
                Button {
                    self.selectedGameMode = .multipleTargets
                } label: {
                    Text("MULTIPLE TARGETS")
                }
                .buttonStyle(OptionButtonStyle(isSelected: self.selectedGameMode == .multipleTargets))
                
            }
            .padding()
            
            Text("SELECT YOUR GUN")
                .font(Font.custom("ARCADE_I.tff", size: 50))
            
            HStack {
                Button {
                    self.selectedGun = .teamGlock
                } label: {
                    Text("#TEAMGLOCK")
                }
                .buttonStyle(OptionButtonStyle(isSelected: self.selectedGun == .teamGlock))
                
                Button {
                    self.selectedGun = .deagleDiva
                } label: {
                    Text("DEAGLE DIVA")
                }
                .buttonStyle(OptionButtonStyle(isSelected: self.selectedGun == .deagleDiva))
                
                Button {
                    self.selectedGun = .m1Shooter
                } label: {
                    Text("M1 SHOOTER")
                }
                .buttonStyle(OptionButtonStyle(isSelected: self.selectedGun == .m1Shooter))
                
            }
            .padding()
            
            Button {
                gameInProgress.toggle()
                musicPlaying.toggle()
            } label: {
                Text("LET'S PLAY!!")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
