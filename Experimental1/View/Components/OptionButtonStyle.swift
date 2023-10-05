//
//  OptionButton.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-05.
//

import SwiftUI

struct OptionButtonStyle: ButtonStyle {
    var isSelected: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(isSelected ? Color.blue : Color.gray)
            .foregroundColor(Color.white)
            .cornerRadius(8)
    }
}
