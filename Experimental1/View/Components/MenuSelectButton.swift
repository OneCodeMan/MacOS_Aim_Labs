//
//  MenuButton.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-05.
//

import SwiftUI

struct MenuSelectButton: View {
    let title: String
    let buttonAction: () -> ()
    
    var body: some View {
        Button {
            Sounds.playSounds(soundfile: Constants.MenuSounds.genericMenuItemSelectString)
            buttonAction()
        } label: {
            Text(title.uppercased())
        }
    }
}
