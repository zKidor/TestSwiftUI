//
//  LandmarkRow.swift
//  TSwiftUI
//
//  Created by zhanlijia on 2019/10/18.
//  Copyright © 2019 zhanlijia. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark:Landmark
    
    var body: some View {
        HStack {
            
            landmark.image.resizable().frame(width: 50, height: 50)
            
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(Image.Scale.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            LandmarkRow(landmark: landmarkData[0])
                
            LandmarkRow(landmark: landmarkData[1])
            
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
