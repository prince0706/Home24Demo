//
//  GridCell.swift
//  Home24Demo
//
//  Created by Prince on 22/07/18.
//  Copyright © 2018 Home24Demo. All rights reserved.
//

import UIKit
import SDWebImage

class GridCell: UICollectionViewCell {
    
	@IBOutlet weak var articleImageView: UIImageView!
	@IBOutlet weak var likeImageView: UIImageView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		layer.borderColor = UIColor.lightGray.cgColor
	}
	
	func setDataOnCell(article: Article) {
		
		if let uri = article.media?.first?.uri {
			articleImageView.sd_setImage(with: URL(string: uri), placeholderImage: UIImage(), options: .retryFailed)
		}
		
		if article.isSelected {
			likeImageView.isHidden = false
		} else {
			likeImageView.isHidden = true
		}
	}
	
}
