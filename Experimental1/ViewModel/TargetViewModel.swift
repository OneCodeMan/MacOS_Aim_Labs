//
//  TargetViewModel.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-08.
//

import Foundation
import SwiftUI

class TargetViewModel: ObservableObject {
    @State var hitpoints: Int = 1
    @State var targetDestroyed = false
    
    func targetHit(with damage: Int) {
        self.hitpoints -= damage
    }
}
