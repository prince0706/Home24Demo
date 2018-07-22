//
//  APIDataSource+APIServiceDetails.swift
//  Home24Demo
//
//  Created by Prince on 21/07/18.
//  Copyright © 2018 Home24Demo. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

enum APIService {
	case getArticles(articleLimit: Int)

    var path: String {
        switch self { // please do not use default case
        case .getArticles:
            return "/categories/100/articles"
        }
    }

    var parameters: [String: Any] {
        switch self { // please do not use default case
        case let .getArticles(articleLimit):
			let params = ["appDomain": 1, "locale": "de_DE", "limit": articleLimit] as [String : Any]
			return params
        }
    }

    var method: HTTPMethod {
        switch self { // please do not use default case
        case .getArticles:
            return .get
        }
    }

    func response(response: WebServiceResponse) -> Any? {
        switch self {
        case .getArticles:
			if let dataDict = response.result as? [String: Any] {
				if let embeddedDict = dataDict["_embedded"] as? [String: Any] {
					if let result = embeddedDict["articles"] as? [[String: Any]] {
						let articleListing: [Article] = Mapper<Article>().mapArray(JSONArray: result)
						return articleListing
					}
				}
				return nil
			} else {
				return nil
			}        }
    }
	
}
