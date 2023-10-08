//
//  Circle+Circle.swift
//  Experimental1
//
//  Created by Dave Gumba on 2023-10-07.
//

import Foundation

import SwiftUI
import CGExtender

struct Circle_Circle: View {
    typealias Key = CollectDict<Int, Anchor<CGPoint>>
    let r1: CGFloat = 50.0
    let r2: CGFloat = 50.0
    
    func collisions(_ proxy: GeometryProxy, _ centers: [Int: [Anchor<CGPoint>]]) -> Bool {
        let c1 = proxy[centers[1]!.first!]
        let c2 = proxy[centers[2]!.first!]
        let screenCenterX = proxy.size.width/2
        let screenCenterY = proxy.size.height/2
        let offset = CGSize(width: c1.x - screenCenterX, height: c1.y - screenCenterY)
        let pOff = CGSize(width: c2.x - screenCenterX, height: c2.y - screenCenterY)
        
        let collisionExists = distance(c1, c2) < r1 + r2
        
        return collisionExists
    }
    
    var body: some View {
        ZStack {
            CircleView(radius: r1, id: 2)
            CircleView(radius: r2, id: 1)
        }.overlayPreferenceValue(Key.self) { (centers: [Int: [Anchor<CGPoint>]])  in
            GeometryReader { (proxy: GeometryProxy) in
                // self.collisions(proxy, centers)
            }
        }
    }
}

struct Circle_Circle_Previews: PreviewProvider {
    static var previews: some View {
        Circle_Circle()
    }
}

/// Preference Key for merging values of sibling views into an array
struct CollectDict<Key: Hashable, Value>: PreferenceKey {
    static var defaultValue: [Key:[Value]] { [:] }
    static func reduce(value: inout [Key:[Value]], nextValue: () -> [Key:[Value]]) {
        // if the next value shares Keys with the current value append the elements
        // of the next values array onto the the current value array.
        value.merge(nextValue()) { (current, new) in
            var temp = current
            temp.append(contentsOf: new)
            return temp
        }
    }
}


// MARK: CircleView

// MARK: - Circle
struct CircleView: View {
    var radius: CGFloat
    var id: Int
    @State var offset: CGSize = .zero
    @State var dragState: CGSize = .zero
    typealias Key = CollectDict<Int, Anchor<CGPoint>>
    
    var body: some View {
        Circle()
            .fill(Color.blue)
            .anchorPreference(key: Key.self, value: .center, transform: { [self.id : [$0]] })
            .frame(width: radius*2, height: radius*2)
            .offset(offset + dragState)
            .simultaneousGesture(
                DragGesture()
                    .onChanged({ (value) in
                        self.dragState = value.translation
                    }).onEnded({ (value) in
                        self.dragState = .zero
                        self.offset.width += value.translation.width
                        self.offset.height += value.translation.height
                    }))
    }
}
