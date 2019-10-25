//
//  FeaturedLandmarks.swift
//  TSwiftUI
//
//  Created by zhanlijia on 2019/10/25.
//  Copyright © 2019 zhanlijia. All rights reserved.
//

import SwiftUI

struct FeaturedLandmarks: View {
    
    var landmarkd:[Landmark]
    
    var body: some View {
        landmarkd[0].image.resizable()
    }
}

struct FeaturedLandmarks_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedLandmarks(landmarkd: Array(landmarkData.prefix(3)))
    }
}
