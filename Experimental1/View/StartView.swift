//
//  StartView.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-05.
//

import SwiftUI

struct StartView: View {
    @State var selectedGameMode = 1
    @State var selectedGun = 1
    @State var gameInProgress = false
    
    var body: some View {
        Group {
            if gameInProgress {
                GameView()
            } else {
                VStack {
                    Text("MacOS Aim Labs")
                        .font(Font.custom("ARCADE_I.tff", size: 70))
                        .padding()
                    
                    Text("GAME MODE")
                        .font(Font.custom("ARCADE_I.tff", size: 50))
                    
                    // Button group here
                    HStack {
                        Button {
                            self.selectedGameMode = 1
                        } label: {
                            Text("HEADSHOT CITY")
                        }
                        .buttonStyle(OptionButtonStyle(isSelected: self.selectedGameMode == 1))
                        
                        Button {
                            self.selectedGameMode = 2
                        } label: {
                            Text("SINGLE FLUCTUATING")
                        }
                        .buttonStyle(OptionButtonStyle(isSelected: self.selectedGameMode == 2))
                        
                        Button {
                            self.selectedGameMode = 3
                        } label: {
                            Text("MULTIPLE TARGETS")
                        }
                        .buttonStyle(OptionButtonStyle(isSelected: self.selectedGameMode == 3))
                        
                    }
                    .padding()
                    
                    Text("SELECT YOUR GUN")
                        .font(Font.custom("ARCADE_I.tff", size: 50))
                    
                    HStack {
                        Button {
                            self.selectedGun = 1
                        } label: {
                            Text("#TEAMGLOCK")
                        }
                        .buttonStyle(OptionButtonStyle(isSelected: self.selectedGun == 1))
                        
                        Button {
                            self.selectedGun = 2
                        } label: {
                            Text("DEAGLE DIVA")
                        }
                        .buttonStyle(OptionButtonStyle(isSelected: self.selectedGun == 2))
                        
                        Button {
                            self.selectedGun = 3
                        } label: {
                            Text("M1 SHOOTER")
                        }
                        .buttonStyle(OptionButtonStyle(isSelected: self.selectedGun == 3))
                        
                    }
                    .padding()
                    
                    Button {
                        gameInProgress.toggle()
                    } label: {
                        Text("LET'S PLAY!!")
                    }
                    .buttonStyle(.borderedProminent)
                    
                } // VStack
                .padding()
            }
            
        }
        
    }
}

#Preview {
    StartView()
}
