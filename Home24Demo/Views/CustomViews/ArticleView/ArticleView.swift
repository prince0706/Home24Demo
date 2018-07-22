//
//  ArticleView.swift
//  Home24Demo
//
//  Created by Prince on 22/07/18.
//  Copyright © 2018 Home24Demo. All rights reserved.
//

import UIKit
import CoreMotion
import SDWebImage

class ArticleView: SwipeableCardViewCard {

    @IBOutlet private weak var imageBackgroundColorView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var backgroundContainerView: UIView!

    /// Shadow View
    private weak var shadowView: UIView?

    /// Inner Margin
    private static let kInnerMargin: CGFloat = 20.0

    var article: Article? {
        didSet {
            configure(forArticle: article)
        }
    }

    private func configure(forArticle article: Article?) {
        if let article = article {

            imageBackgroundColorView.backgroundColor = UIColor.gray
			
			if let uri = article.media?.first?.uri {
				imageView.sd_setImage(with: URL(string: uri), placeholderImage: UIImage(), options: .retryFailed)
			}

            backgroundContainerView.layer.cornerRadius = 14.0
		}
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        configureShadow()
    }

    // MARK: - Shadow

    private func configureShadow() {
        // Shadow View
        self.shadowView?.removeFromSuperview()
        let shadowView = UIView(frame: CGRect(x: ArticleView.kInnerMargin,
                                              y: ArticleView.kInnerMargin,
                                              width: bounds.width - (2 * ArticleView.kInnerMargin),
                                              height: bounds.height - (2 * ArticleView.kInnerMargin)))
        insertSubview(shadowView, at: 0)
        self.shadowView = shadowView

        self.applyShadow(width: CGFloat(0.0), height: CGFloat(0.0))
    }

    private func applyShadow(width: CGFloat, height: CGFloat) {
        if let shadowView = shadowView {
            let shadowPath = UIBezierPath(roundedRect: shadowView.bounds, cornerRadius: 14.0)
            shadowView.layer.masksToBounds = false
            shadowView.layer.shadowRadius = 8.0
            shadowView.layer.shadowColor = UIColor.black.cgColor
            shadowView.layer.shadowOffset = CGSize(width: width, height: height)
            shadowView.layer.shadowOpacity = 0.15
            shadowView.layer.shadowPath = shadowPath.cgPath
        }
    }

}
