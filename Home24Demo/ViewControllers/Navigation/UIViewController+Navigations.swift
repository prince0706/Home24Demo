//
//  UIViewController+Navigations.swift
//  Home24Demo
//
//  Created by Prince on 22/07/18.
//  Copyright © 2018 Home24Demo. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    func popToRootViewController() {
        _ = navigationController?.popToRootViewController(animated: false)
    }

    @IBAction func popViewController() {
        _ = navigationController?.popViewController(animated: true)
    }

    /**
     Present alert with ok  buttton only.

     - parameter title:     String which show as title
     - parameter message :  String which show as message
     - parameter handler:   Callback action to handle action

     - returns:  Completion handler returns callback to function
     */
    func alertWithOk(_ title: String, message: String, handler: ((UIAlertAction?) -> Void)? = nil) -> UIAlertController {

        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "OK"), style: UIAlertActionStyle.default, handler: handler))
        return alert
    }

	
	/// Method ro create Nav bar button
	///
	/// - Parameter text: Button Text
	/// - Returns: returns UIBarButtonItem refrence
	func nextBarButton(text: String) -> UIBarButtonItem {
		let customButton = UIButton(type: .custom)
		customButton.frame = CGRect(x: 0, y: 0, width: 70, height: 30)
		customButton.setImage(UIImage(), for: .normal)
		customButton.titleLabel?.font = UIFont.systemFont(ofSize: 17.0)
		
		customButton.setTitleColor(UIColor.black, for: .normal)
		customButton.setTitle(text, for: .normal)
		customButton.addTarget(self, action: #selector(nextBarButtonItemPressed), for: .touchUpInside)
		let barButton = UIBarButtonItem(customView: customButton)
		return barButton
	}
	
	@objc func nextBarButtonItemPressed() {
		
	}

    func pushToSelectionScreenViewController() {
        if let selectionScreenViewController = UIStoryboard.mainStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.selectionScreenViewController.rawValue) as? SelectionScreenViewController {
            navigationController?.pushViewController(selectionScreenViewController, animated: true)
        }
    }
	
	func pushToReviewViewController(articles: [Article]) {
		if let reviewViewController = UIStoryboard.mainStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.reviewViewController.rawValue) as? ReviewViewController {
			reviewViewController.articles = articles
			navigationController?.pushViewController(reviewViewController, animated: true)
		}
	}
    
}
