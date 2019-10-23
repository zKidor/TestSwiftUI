//
//  ContentView.swift
//  TSwiftUI
//
//  Created by zhanlijia on 2019/10/17.
//  Copyright © 2019 zhanlijia. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @EnvironmentObject var userData:UserData
    
    var landmark:Landmark
    
    var landmarkIndex : Int{
        userData.landmarks.firstIndex { (entity) -> Bool in
            return landmark.id == entity.id
            }!
    }
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate).frame(height:300)
                .edgesIgnoringSafeArea(.top)
            
            CircleImg(image: landmark.image)
                .offset( y: -130)
                .padding(.bottom,-130)
                
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(Color.black)
                    
                    Button(action: {
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                    }) {
                        if self.userData.landmarks[self.landmarkIndex].isFavorite{
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }else{
                            Image(systemName: "star")
                                .foregroundColor(.gray)
                        }
                    }
                }
                    
                
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
        .navigationBarTitle(Text(landmark.name),displayMode: .inline)
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0]).environmentObject(UserData())
    }
}
