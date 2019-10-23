//
//  HikeView.swift
//  TSwiftUI
//
//  Created by zhanlijia on 2019/10/23.
//  Copyright © 2019 zhanlijia. All rights reserved.
//

import SwiftUI

struct HikeView: View {
    var hike:Hike
    @State private var showDetail = false
    
    var body: some View {
        
        VStack{
            HStack{
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width:50,height:50)
                
                VStack(alignment: .leading){
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }
                
                Spacer()
                
                Button(action: {
                    self.showDetail.toggle()
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
//                    .animation(nil)
                        .scaleEffect(showDetail ? 1.5 : 1)
                    .padding()
//                        .animation(.spring())
                }
            }
            
            if showDetail{
                HikeDetail(hike: hike)
            }
            
            Spacer()
        }
        
        
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        HikeView(hike: hikeData[0])
    }
}