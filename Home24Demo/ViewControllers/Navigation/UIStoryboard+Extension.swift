//
//  UIStoryboard+Extension.swift
//  Home24Demo
//
//  Created by Prince on 22/07/18.
//  Copyright © 2018 Home24Demo. All rights reserved.
//

// ---------------- This class is used for all StoryBoards Identifers (SB)  in the the app ---------------------------------------

import Foundation
import UIKit

extension UIStoryboard {

    enum StoryboardNames: String {

        case main = "Main"
    }

    // ------------------------------- View Controller Identifier -----------------------

    enum StoryboardViewControllerIdentifier: String {

        case selectionScreenViewController = "SelectionScreenViewController"
		case reviewViewController = "ReviewViewController"
    }

    // MARK: Get App StoryBoards  ------------------------------

    class func mainStoryBoard() -> UIStoryboard {
        let storyboard: UIStoryboard = UIStoryboard(name: StoryboardNames.main.rawValue, bundle: nil)
        return storyboard
    }

}
