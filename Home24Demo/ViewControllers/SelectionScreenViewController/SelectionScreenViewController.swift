//
//  SelectionScreenViewController.swift
//  Home24Demo
//
//  Created by Prince on 22/07/18.
//  Copyright © 2018 Home24Demo. All rights reserved.
//

import UIKit

class SelectionScreenViewController: UIViewController, SwipeableCardViewDataSource, SwipeableCardViewDelegate {

	@IBOutlet private weak var swipeableCardView: SwipeableCardViewContainer!
	@IBOutlet weak var articlesCountLabel: UILabel!
	@IBOutlet weak var noArticlesLabel: UILabel!
	
	private var totalLikes: Int = 0
	private var articles = [Article]()
	
	
	/// Change this limit to fetch the required number of articles from server
	private var articleLimit = 15
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		title = "Selection"
		swipeableCardView.dataSource = self
		swipeableCardView.delegate = self
		articlesCountLabel.text = ""
		noArticlesLabel.isHidden = true
		getArticles()
		navigationItem.rightBarButtonItem = nextBarButton(text: "Review")
		navigationItem.rightBarButtonItem?.isEnabled = false
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		navigationController?.isNavigationBarHidden = false
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// MARK: - Nav Bar Button Delegate
	
	override func nextBarButtonItemPressed() {
		pushToReviewViewController(articles: articles)
	}
	
	// MARK: - Action Delegate Methods
	
	@IBAction func likeButtonTapped(_ sender: Any) {
		swipeableCardView.nextArticle(withDirection: .right)
	}
	
	@IBAction func dislikeButtonTapped(_ sender: Any) {
		swipeableCardView.nextArticle(withDirection: .left)
	}
	
	// MARK: - API Methods
	
	private func getArticles() {
		APIDataSource.callService(service: .getArticles(articleLimit: articleLimit)) { response, _ in
			if isObjectInitialized(response) {
				if let list = response as? [Article] {
					self.articles = list
					self.articlesCountLabel.text = "\(self.totalLikes)/\(self.articles.count)"
					self.swipeableCardView.reloadData()
					self.noArticlesLabel.isHidden = false
				}
			} else {
				self.noArticlesLabel.isHidden = false
			}
		}
	}
}

// MARK: - SwipeableCardViewDataSource

extension SelectionScreenViewController {
	
	func numberOfCards() -> Int {
		return articles.count
	}
	
	func card(forItemAtIndex index: Int) -> SwipeableCardViewCard {
		let article = articles[index]
		let cardView = ArticleView()
		cardView.article = article
		return cardView
	}
	
	func viewForEmptyCards() -> UIView? {
		return nil
	}
	
}

// MARK: - SwipeableCardViewDelegate

extension SelectionScreenViewController {
	
	func didSelect(card: SwipeableCardViewCard, atIndex index: Int) {
		
	}
	
	func cardDirection(card: SwipeableCardViewCard, atIndex index: Int) {
		
		if index == articles.count - 1 {
			navigationItem.rightBarButtonItem?.isEnabled = true
		}
		
		if let direction = card.direction {
			switch direction {
			case .right, .bottomRight, .topRight:
				let article = articles[index]
				article.isSelected = true
				totalLikes += 1
				articlesCountLabel.text = "\(totalLikes)/\(articles.count)"
			default:
				print("None")
			}
		}
	}
}
