//
//  APIDataSource.swift
//  Home24Demo
//
//  Created by Prince on 21/07/18.
//  Copyright © 2018 Home24Demo. All rights reserved.
//

// --- This class is for all Web services methods used only in this project ---//

import Foundation
import Alamofire

typealias ResultCompletionHander = (_ resultModel: Any?, _ error: String?) -> Void

class APIDataSource {

    class func callService(service: APIService, _ completionhandler: @escaping ResultCompletionHander) {

        NetworkConnection.callServiceWithName(service.method, serviceName: service.path, parameters: service.parameters) { (response, result) -> Void in

            self.handleResponse(service: service, response: response, result: result, completionhandler)
        }
    }

}

extension APIDataSource {
    class func handleResponse(service: APIService, response: DataServiceResponse, result: AnyObject?, _ completionhandler: @escaping ResultCompletionHander) {
        if response.successful(), let res = result as? [String: Any] {
            let wbrespons = WebServiceResponse(result: res, service: service)
            if wbrespons.success {
                let modelResponse = service.response(response: wbrespons)
                completionhandler(modelResponse, nil)
            } else {
                completionhandler(nil, nil)
            }
        } else {
            completionhandler(nil, "Something went wrong")
        }
    }
}
