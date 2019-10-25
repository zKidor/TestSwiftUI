//
//  CategoryItem.swift
//  TSwiftUI
//
//  Created by zhanlijia on 2019/10/25.
//  Copyright © 2019 zhanlijia. All rights reserved.
//

import SwiftUI

struct CategoryItem: View {
    
    var landMark:Landmark
    
    var body: some View {
        VStack(alignment:.leading){
            landMark.image.resizable()
                .renderingMode(.original)//navigation button的label传递文字会使用环境的强调色渲染，图像可能会被当做透明image
                .frame(width: 155, height: 155)
            .cornerRadius(5)
            Text(landMark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading,15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landMark: landmarkData[0])
    }
}
