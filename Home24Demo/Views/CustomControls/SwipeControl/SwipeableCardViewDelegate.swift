//
//  SwipeableCardViewDelegate.swift
//  Home24Demo
//
//  Created by Prince on 22/07/18.
//  Copyright © 2018 Home24Demo. All rights reserved.
//

import Foundation

protocol SwipeableCardViewDelegate: class {

    func didSelect(card: SwipeableCardViewCard, atIndex index: Int)
	func cardDirection(card: SwipeableCardViewCard, atIndex index: Int)

}
