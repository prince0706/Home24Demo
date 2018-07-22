//
//  Utilities.swift
//  Home24Demo
//
//  Created by Prince on 21/07/18.
//  Copyright © 2018 Home24Demo. All rights reserved.
//

import Foundation
import UIKit
// class Utilities {

// ------------------------------------------- Alerts -------------------------------------------
let kTryAgainMessage = "Something went wrong, please try again."

/**
 Global function to check if the input object is initialized or not.

 - parameter value: value to verify for initialization

 - returns: true if initialized
 */
func isObjectInitialized(_ value: Any?) -> Bool {
    guard let _ = value else {
        return false
    }
    return true
}

// MARK: Thead Queues -------------------------------------
func dispatchMainQueue(_ block: @escaping () -> Void) {
    DispatchQueue.main.async { () -> Void in
        block()
    }
}

struct Device {
    // iDevice detection code
    static let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad
    static let IS_IPHONE = UIDevice.current.userInterfaceIdiom == .phone
    static let IS_RETINA = UIScreen.main.scale >= 2.0

    static let SCREEN_WIDTH = Int(UIScreen.main.bounds.size.width)
    static let SCREEN_HEIGHT = Int(UIScreen.main.bounds.size.height)
    static let SCREEN_MAX_LENGTH = Int(max(SCREEN_WIDTH, SCREEN_HEIGHT))
    static let SCREEN_MIN_LENGTH = Int(min(SCREEN_WIDTH, SCREEN_HEIGHT))

    static let IS_IPHONE_4_OR_LESS = IS_IPHONE && SCREEN_MAX_LENGTH < 568
    static let IS_IPHONE_5 = IS_IPHONE && SCREEN_MAX_LENGTH == 568
    static let IS_IPHONE_6 = IS_IPHONE && SCREEN_MAX_LENGTH == 667
    static let IS_IPHONE_6P = IS_IPHONE && SCREEN_MAX_LENGTH == 736
    static let IS_IPHONE_X = IS_IPHONE && SCREEN_MAX_LENGTH == 812
}

