//
//  View+Hidden.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-05.
//

// https://stackoverflow.com/questions/56490250/dynamically-hiding-view-in-swiftui

import Foundation
import SwiftUI

extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}
