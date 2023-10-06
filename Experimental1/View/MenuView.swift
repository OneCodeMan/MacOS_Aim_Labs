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
                MenuSelectButton(title: "SINGLE FLUCTUATING TARGET") {
                    self.selectedGameMode = .singleFluctuatingTarget
                }
                .buttonStyle(MenuSelectButtonStyle(isSelected: self.selectedGameMode == .singleFluctuatingTarget))
                
                MenuSelectButton(title: "MULTIPLE TARGETS") {
                    self.selectedGameMode = .multipleTargets
                }
                .buttonStyle(MenuSelectButtonStyle(isSelected: self.selectedGameMode == .multipleTargets))
                
                MenuSelectButton(title: "HEADSHOT CITY") {
                    self.selectedGameMode = .headshotCity
                }
                .buttonStyle(MenuSelectButtonStyle(isSelected: self.selectedGameMode == .headshotCity))
                
                MenuSelectButton(title: "RAMBO HEADSHOT") {
                    self.selectedGameMode = .ramboHeadshot
                }
                .buttonStyle(MenuSelectButtonStyle(isSelected: self.selectedGameMode == .ramboHeadshot))
            }
            .padding()
            
            Text("SELECT YOUR GUN")
                .font(Font.custom("ARCADE_I.tff", size: 50))
            
            HStack {
                
                MenuSelectButton(title: "#TEAMGLOCK") {
                    self.selectedGun = .teamGlock
                }
                .buttonStyle(MenuSelectButtonStyle(isSelected: self.selectedGun == .teamGlock))
                
                MenuSelectButton(title: "DEAGLE DIVA") {
                    self.selectedGun = .deagleDiva
                }
                .buttonStyle(MenuSelectButtonStyle(isSelected: self.selectedGun == .deagleDiva))
                
                MenuSelectButton(title: "M1 SHOOTER") {
                    self.selectedGun = .m1Shooter
                }
                .buttonStyle(MenuSelectButtonStyle(isSelected: self.selectedGun == .m1Shooter))
            }
            .padding()
            
            MenuActionButton(title: "LET'S PLAY!!") {
                gameInProgress.toggle()
                musicPlaying.toggle()
            }
        }
    }
}
