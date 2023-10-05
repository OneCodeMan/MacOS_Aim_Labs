//
//  MenuActionButtonStyle.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-05.
//

import SwiftUI

struct MenuActionButtonStyle: ButtonStyle {
    @State var color: Color = .indigo   // default color if not initialized
        
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .font(.title.bold())
            .padding()
            .frame(maxWidth: 200)
            .foregroundColor(.white)
            .background(color)
            .cornerRadius(12)
    }
}
