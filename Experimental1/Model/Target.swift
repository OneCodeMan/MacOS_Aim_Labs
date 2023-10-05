//
//  Target.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-04.
//

import Foundation
import SwiftUI

struct Target {
    let colour: Color
    var hitpoints: Int
    let shape: any Shape
    let width: CGFloat
    let height: CGFloat
    let destroySound: String
    
    init(colour: Color = Color.red, hitpoints: Int = 1, shape: any Shape = Circle(), width: CGFloat = 40.0, height: CGFloat = 40.0, destroySound: String = Constants.TargetDestroySounds.death2SoundString) {
        self.colour = colour
        self.hitpoints = hitpoints
        self.shape = shape
        self.width = width
        self.height = height
        self.destroySound = destroySound
    }
}
