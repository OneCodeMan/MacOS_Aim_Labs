//
//  GameMode.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-05.
//

import Foundation

enum GameMode: Int, CustomStringConvertible {
    case singleFluctuatingTarget = 1
    case multipleTargets = 2
    case headshotCity = 3
    
    var description: String {
        switch self {
        case .singleFluctuatingTarget:
            "Single target"
        case .multipleTargets:
            "Multiple targets"
        case .headshotCity:
            "Headshot city"
        }
    }
}

enum SelectedGun: Int, CustomStringConvertible {
    case teamGlock = 1
    case deagleDiva = 2
    case m1Shooter = 3
    
    var description: String {
        switch self {
        case .teamGlock:
            "Glockkkaaa"
        case .deagleDiva:
            "Deagle"
        case .m1Shooter:
            "M1911"
        }
    }
}
