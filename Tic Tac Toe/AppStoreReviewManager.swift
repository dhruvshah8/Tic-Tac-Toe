//
//  AppStoreReviewManager.swift
//  Tic Tac Toe
//
//  Created by Harshil Patel on 3/30/19.
//  Copyright © 2019 Harshil Patel. All rights reserved.
//

import Foundation

import StoreKit

@available(iOS 10.3, *)

enum AppStoreReviewManager {
    
    static let minimumRuns = 5                       // A constant value to specify the number of times that user must run the app!
    
    static func requestReviewIfAppropriate() {
        
        let defaults = UserDefaults.standard
        
        var actionCount = defaults.integer(forKey: "runs")
        
        actionCount += 1
        
        defaults.set(actionCount, forKey: "runs")
        
        //Checking the action count with minimum runs if it's true then it'll ask for review else it'll fall through
        
        guard actionCount >= minimumRuns else{
            return
        }
        
        SKStoreReviewController.requestReview()
        defaults.set(0, forKey: "runs")               // This will set the user entry to zero again for next permission
    }
}

