//
//  DataServiceResponse.swift
//  Home24Demo
//
//  Created by Prince on 21/07/18.
//  Copyright © 2018 Home24Demo. All rights reserved.
//

// ---------------- This class is used to check Web service response type  in the the app ---------------------------------------

import Foundation

enum DataServiceResponse {

    case success
    case error(String?)
    case serverFail(String?) // this shouldn't really happen, but...
    case missingOrBadValue(String?)
    case unknown(String?)

    func successful() -> Bool {
        switch self {
        case .success:
            return true
        default:
            return false
        }
    }
}
