//
//  PageViewController.swift
//  TSwiftUI
//
//  Created by zhanlijia on 2019/10/28.
//  Copyright © 2019 zhanlijia. All rights reserved.
//

import SwiftUI

struct PageViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIPageViewController
    
    var controllers:[UIViewController]
    
    //绑定值，变化会自动更新界面？？？
    @Binding var currentPage:Int
    
    func makeCoordinator() -> PageViewController.Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<PageViewController>) -> UIPageViewController {
        
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal)
        
        pageViewController.dataSource = context.coordinator
        
        pageViewController.delegate = context.coordinator
        
        return pageViewController
        
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: UIViewControllerRepresentableContext<PageViewController>) {
        
        uiViewController.setViewControllers([controllers[0]], direction: UIPageViewController.NavigationDirection.forward, animated: true) { (isAnimationFinish) in
            
        }
        
    }
    
    class Coordinator:NSObject,UIPageViewControllerDataSource,UIPageViewControllerDelegate{
        
        var parent:PageViewController
        
        init(_ pageViewController:PageViewController){
            self.parent = pageViewController
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index == 0{
                return parent.controllers.last
            }
            return parent.controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index + 1 == parent.controllers.count{
                return parent.controllers.first
            }
            return parent.controllers[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            
            if completed,
                let visibleViewController = pageViewController.viewControllers?.first,
                let index = parent.controllers.firstIndex(of: visibleViewController)
            {
                parent.currentPage = index
            }
            
        }
    }
}

//struct PageViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        PageViewController(controllers: <#T##[UIViewController]#>)
//    }
//}
