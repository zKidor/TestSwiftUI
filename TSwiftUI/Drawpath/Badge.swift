//
//  Badge.swift
//  TSwiftUI
//
//  Created by zhanlijia on 2019/10/23.
//  Copyright © 2019 zhanlijia. All rights reserved.
//

import SwiftUI

struct Badge: View {
    
    static let rotaionCount = 8
    
    var badgeSymbols: some View{
        ForEach(0 ..< Badge.rotaionCount){ i in
            RotatedBadgeSymbol(angle: Angle(degrees: (Double(i) / Double(Self.rotaionCount)) * 360)
            )
            .opacity(0.5)
        }
    }
    
    var body: some View {
        ZStack{
            BadgeBackground()
            
            GeometryReader{ geometry in
                self.badgeSymbols
                    .scaleEffect(1.0 / 4, anchor: .top)
                    .position(x: geometry.size.width / 2, y: (3.0 / 4) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
    
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
