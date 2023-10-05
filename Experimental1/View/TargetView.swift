//
//  TargetView.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-05.
//

import SwiftUI

struct TargetView: View {
    let target: Target
    
    var onTap: () -> Void

    var body: some View {
        Circle()
            .fill(target.colour)
            .frame(width: target.width, height: target.height)
            .onTapGesture {
                onTap()
            }
    }
}
