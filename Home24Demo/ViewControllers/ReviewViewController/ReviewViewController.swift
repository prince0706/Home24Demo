//
//  ReviewViewController.swift
//  Home24Demo
//
//  Created by Prince on 22/07/18.
//  Copyright © 2018 Home24Demo. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

	var articles = [Article]()

	@IBOutlet weak var listTableView: UITableView!
	@IBOutlet weak var segmentObj: UISegmentedControl!
	@IBOutlet weak var gridcollectionView: UICollectionView!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		title = "Review"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBAction func segmentButtonTapped(_ sender: Any) {
		if segmentObj.selectedSegmentIndex == 0 {
			gridcollectionView.isHidden = true
		} else {
			gridcollectionView.isHidden = false
		}
	}
}

extension ReviewViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return articles.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCellID", for: indexPath) as? ListCell else {
			return UITableViewCell()
		}
		
		cell.setDataOnCell(article: articles[indexPath.row])
		return cell
	}
}

extension ReviewViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return articles.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCellID", for: indexPath) as? GridCell else {
			return UICollectionViewCell()
		}
		
		cell.setDataOnCell(article: articles[indexPath.row])
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let cellWidth = ((collectionView.frame.size.width - 40)/2)
		return CGSize(width: cellWidth, height: cellWidth)
	}
}
