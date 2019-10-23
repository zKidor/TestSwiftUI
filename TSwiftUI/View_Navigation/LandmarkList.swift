//
//  LandmarkList.swift
//  TSwiftUI
//
//  Created by zhanlijia on 2019/10/18.
//  Copyright © 2019 zhanlijia. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    
//    @State var showFavoritesOnly = true
    
    @EnvironmentObject var userdata :UserData
    
    var body: some View {
        
        //        List{
        //            LandmarkRow(landmark: landmarkData[0])
        //            LandmarkRow(landmark: landmarkData[1])
        //        }
        
        
//        NavigationView{
//            List(landmarkData,id: \.id ) { landmark in
//
//                if !self.showFavoritesOnly || landmark.isFavorite{
//                    NavigationLink(destination: LandmarkDetail(landmark: landmark)){
//                        LandmarkRow(landmark: landmark)
//                    }
//                }
//            }
//
//            .navigationBarTitle(Text("Landmarks"))
//        }
        
        
        NavigationView{
            List{
                
                Toggle(isOn: $userdata.showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(userdata.landmarks){ landmark in
                    
                    if !self.userdata.showFavoritesOnly || landmark.isFavorite{
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                            LandmarkRow(landmark: landmark)
                        }
                    }
                    
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE","iPhone XS Max","iPad Pro (11-inch)"],id:\.self) { deviceName in
            LandmarkList()
            .environmentObject(UserData())
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
        
    }
}
