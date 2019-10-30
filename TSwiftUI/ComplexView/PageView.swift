//
//  PageView.swift
//  TSwiftUI
//
//  Created by zhanlijia on 2019/10/28.
//  Copyright © 2019 zhanlijia. All rights reserved.
//

import SwiftUI
import SwiftEventBus

struct PageView<Page:View>: View {
    //UIHostingController是一个UIViewController的子类，表示UIKit上下文中的SwiftUI view
    var viewControllers:[UIHostingController<Page>]
    
    @State var currentPage = 0
    
    init(_ views:[Page]) {
        self.viewControllers = views.map({ (view) -> UIHostingController<Page> in
            return UIHostingController(rootView: view)
        })
        
        
//            SwiftEventBus.onMainThread(self as AnyObject, name: SwiftEventBusConstance.PAGECONTROL_VALUE_CHANGE) { (notification) in
//                if let index = notification?.object as? Int{
//                    self.currentPage = index
//                }
//            }
        
    }
    

    
    var body: some View {
        ZStack(alignment:.bottomTrailing){
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
            
            PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
                .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(features.map { FeatureCard(landmark: $0) }).aspectRatio(3 / 2, contentMode: .fit)
    }
}
