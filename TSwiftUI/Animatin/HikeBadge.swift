//
//  HikeBadge.swift
//  TSwiftUI
//
//  Created by zhanlijia on 2019/10/26.
//  Copyright © 2019 zhanlijia. All rights reserved.
//

import SwiftUI

struct HikeBadge: View {
    var name:String
    
    var body: some View {
        VStack(alignment:.center){
            Badge()
                .frame(width:300,height:300)
                .scaleEffect(1 / 3)
                .frame(width:100,height:100)
            
            Text(name)
                .font(.caption)
                .accessibility(label: Text("Badge for \(name)."))
        }
    }
}

struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Preview Testing")
    }
}
