//
//  WebServiceResponse.swift
//  Home24Demo
//
//  Created by Prince on 21/07/18.
//  Copyright © 2018 Home24Demo. All rights reserved.
//

import Foundation

class WebServiceResponse {

    var message = ""
    var success = false
    var result: Any?

    init(result: [String: Any]?, service: APIService, showFailureMessage: Bool = true) {
        if isObjectInitialized(result) {
            
            if isObjectInitialized(result) {
                success = true
                self.result = result
            } else {
                success = false
            }
        }
    }
    
}
