//
//  CircleImg.swift
//  TSwiftUI
//
//  Created by zhanlijia on 2019/10/18.
//  Copyright © 2019 zhanlijia. All rights reserved.
//

import SwiftUI

struct CircleImg: View {
    var image:Image
    
    var body: some View {
        image.clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
}

struct CircleImg_Previews: PreviewProvider {
    static var previews: some View {
        CircleImg(image: Image("turtlerock"))
    }
}
