//
//  PassthroughView.swift
//  ShoppingApp
//
//  Created by Kevin Phan on 10/17/21.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import UIKit

class PassthroughView: UICollectionView {
    
    var viewsWithActiveTouch: [UIView]?
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {

           //More elegant way
           
           let view = super.hitTest(point, with: event)
           return view == self ? nil : view
        
        //Logically makes sense
        /*
        if let activeViews = viewsWithActiveTouch {
                for view in activeViews {
                    if view.frame.contains(point) {
                        return view
                   }
                }
             }
             return nil
         
        */
        
        //Implementing using opacity route
        /*
        if let activeViews = viewsWithActiveTouch {
                for view in activeViews {
                    if view.alpha < 0.01 {
                        return view
                   }
                }
             }
             return nil
         */
    }
}
