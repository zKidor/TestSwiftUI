//
//  PageControl.swift
//  TSwiftUI
//
//  Created by zhanlijia on 2019/10/30.
//  Copyright © 2019 zhanlijia. All rights reserved.
//

import SwiftUI
import SwiftEventBus

struct PageControl: UIViewRepresentable {
    
    
    typealias UIViewType = UIPageControl
    
    var numberOfPages:Int
    @Binding var currentPage:Int
    
    
    func makeCoordinator() -> PageControl.Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<PageControl>) -> UIPageControl {
        
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        
        control.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentPage(sender:)), for: UIControl.Event.valueChanged)
        
        return control
        
    }
    
    func updateUIView(_ uiView: UIPageControl, context: UIViewRepresentableContext<PageControl>) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var control:PageControl
        
        init(_ control:PageControl){
            self.control = control
        }
        
        @objc func updateCurrentPage(sender:UIPageControl){
            control.currentPage = sender.currentPage
            SwiftEventBus.postToMainThread(SwiftEventBusConstance.PAGECONTROL_VALUE_CHANGE, sender: control.currentPage)
        }
    }
}

//struct PageControl_Previews: PreviewProvider {
//    static var previews: some View {
//        PageControl()
//    }
//}
