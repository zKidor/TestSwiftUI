//
//  CategoryHome.swift
//  TSwiftUI
//
//  Created by zhanlijia on 2019/10/25.
//  Copyright © 2019 zhanlijia. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    
    var categories:[String :[Landmark]]{
        Dictionary(
        grouping: landmarkData) { (landmark) -> String in
            landmark.category.rawValue
        }
    }
    
    var featured:[Landmark]{
        landmarkData.filter { (landmark) -> Bool in
            return landmark.isFavorite
        }
    }
    
    var profileButton:some View{
        Button(action: {
            self.showingProfile.toggle()
        }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
            .accessibility(label: Text("User Profile"))
            .padding()
        }
    }
    
    @State var showingProfile = false
    
    @EnvironmentObject var userData :UserData
    
    var body: some View {
        NavigationView{
            
            List{
                
                FeaturedLandmarks(landmarkd: featured)
                .scaledToFill()
                .frame(height:200)
                .clipped()
                    .listRowInsets(EdgeInsets())//去除左右上下的边距
                
                ForEach(categories.keys.sorted(),id:\.self){ key in
                    CategoryRow(categoryName: key, items: self.categories[key] ?? [])
                }
            .listRowInsets(EdgeInsets())
                
                NavigationLink(destination: LandmarkList()){
                    Text("See All")
                }
            }
            
            .navigationBarTitle(Text("Featured"))
                
            .navigationBarItems(trailing: profileButton)
            
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(self.userData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
