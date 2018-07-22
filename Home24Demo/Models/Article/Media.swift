//
//  Media.swift
//  Home24Demo
//
//  Created by Prince on 22/07/18.
//  Copyright © 2018 Home24Demo. All rights reserved.
//

import Foundation
import ObjectMapper

class Media: NSObject, Mappable {
	
	private struct SerializationKeys {
		static let mimeType = "mimeType"
		static let uri = "uri"
		
	}
	
	var mimeType: String?
	var uri: String?
	
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
		mimeType <- map[SerializationKeys.mimeType]
		uri <- map[SerializationKeys.uri]
	}
	
	/// Generates description of the object in the form of a NSDictionary.
	///
	/// - returns: A Key value pair containing all valid values in the object.
	public func dictionaryRepresentation() -> [String: Any] {
		var dictionary: [String: Any] = [:]
		dictionary[SerializationKeys.mimeType] = mimeType
		dictionary[SerializationKeys.uri] = uri
		
		return dictionary
	}
	
}
