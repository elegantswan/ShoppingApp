//
//  HapticsManager.swift
//  ShoppingApp
//
//  Created by Kevin Phan on 10/12/21.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import UIKit

final class HapticsManager {
    
    static let shared = HapticsManager()
    
    private init() {}
    
    public func selectionVibrate() {
        DispatchQueue.main.async {
            let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
            selectionFeedbackGenerator.prepare()
            selectionFeedbackGenerator.selectionChanged()
        }
    }
    
    public func vibrate(for type: UINotificationFeedbackGenerator.FeedbackType) {
        DispatchQueue.main.async {
            let notificationGenerator = UINotificationFeedbackGenerator()
            notificationGenerator.notificationOccurred(type)
        }
    }
}
