//
//  CategoryRow.swift
//  TSwiftUI
//
//  Created by zhanlijia on 2019/10/25.
//  Copyright © 2019 zhanlijia. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName:String
    var items:[Landmark]
    
    var body: some View {
        
        VStack(alignment:.leading){
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading,15)
                .padding(.top,5)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(alignment: .top, spacing: 0){
                    ForEach(self.items){ landMark in
                        
                        NavigationLink(destination: LandmarkDetail(landmark: landMark)){
                            
                            CategoryItem(landMark: landMark)
                            
                        }
                        
                    }
                }
            }
            .frame(height:185)
        }
        
        
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(categoryName: landmarkData[0].category.rawValue, items: Array(landmarkData.prefix(4)))
    }
}
