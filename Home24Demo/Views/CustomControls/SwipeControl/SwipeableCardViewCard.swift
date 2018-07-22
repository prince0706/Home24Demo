//
//  SwipeableCardViewCard.swift
//  Home24Demo
//
//  Created by Prince on 22/07/18.
//  Copyright © 2018 Home24Demo. All rights reserved.
//

import UIKit

class SwipeableCardViewCard: SwipeableView, NibView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

}
