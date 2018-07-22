//
//  Article.swift
//  Home24Demo
//
//  Created by Prince on 22/07/18.
//  Copyright © 2018 Home24Demo. All rights reserved.
//

import UIKit
import ObjectMapper

class Article: NSObject, Mappable {
	
	private struct SerializationKeys {
		static let title = "title"
		static let sku = "sku"
		static let media = "media"
	}
	
	var title: String?
	var sku: String?
	var media: [Media]?
	var isSelected: Bool = false

	// MARK: ObjectMapper Initializers
	/// Map a JSON object to this class using ObjectMapper.
	///
	/// - parameter map: A mapping from ObjectMapper.
	public required init?(map _: Map) {
	}
	
	public override init() {
	}
	
	/// Map a JSON object to this class using ObjectMapper.
	///
	/// - parameter map: A mapping from ObjectMapper.
	public func mapping(map: Map) {
		title <- map[SerializationKeys.title]
		sku <- map[SerializationKeys.sku]
		media <- map[SerializationKeys.media]
	}
	
	/// Generates description of the object in the form of a NSDictionary.
	///
	/// - returns: A Key value pair containing all valid values in the object.
	public func dictionaryRepresentation() -> [String: Any] {
		var dictionary: [String: Any] = [:]
		dictionary[SerializationKeys.title] = title
		dictionary[SerializationKeys.sku] = sku
		dictionary[SerializationKeys.media] = media
		return dictionary
	}
	
}
