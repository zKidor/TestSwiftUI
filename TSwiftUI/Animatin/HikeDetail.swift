//
//  HikeDetail.swift
//  TSwiftUI
//
//  Created by zhanlijia on 2019/10/23.
//  Copyright © 2019 zhanlijia. All rights reserved.
//

import SwiftUI

struct HikeDetail: View {
    
    var hike:Hike
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HikeDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetail(hike: hikeData[0])
    }
}
