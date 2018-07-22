//
//  ListCell.swift
//  Home24Demo
//
//  Created by Prince on 22/07/18.
//  Copyright © 2018 Home24Demo. All rights reserved.
//

import UIKit
import SDWebImage

class ListCell: UITableViewCell {

	@IBOutlet weak var articleImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var likeImageView: UIImageView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	// MARK: - Data Loading Methods
	
	func setDataOnCell(article: Article) {
		titleLabel.text = article.title
		
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
