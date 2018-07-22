//
//  Connection.swift
//  Home24Demo
//
//  Created by Prince on 21/07/18.
//  Copyright © 2018 Home24Demo. All rights reserved.
//

// ---------------- This class is used as Network Layer in the the app ---------------------------------------

import Foundation
import Alamofire

let SUCCESS_CODE = 200
typealias ResponseCompletionHander = (_ response: DataServiceResponse, _ result: AnyObject?) -> Void

class NetworkConnection {

    class func callServiceWithName(_ methodType: HTTPMethod, serviceName: String, parameters: [String: Any], completionHandler: @escaping ResponseCompletionHander) {

        // MANAGE REACHABILITY
        if !handleNetworkReachability() {
            completionHandler(.error(""), nil)
            return
        }

        let params = parameters

        var encoding: ParameterEncoding = JSONEncoding.default
        if methodType == .get || methodType == .delete {
            encoding = URLEncoding.default
        }
        // API HEADERS
        let headers = apiHeader()

        let baseUrl = AppConfiguration.shared.applicationEndPoint() + "\(serviceName)"

        Alamofire.SessionManager.default.session.configuration.timeoutIntervalForRequest = 180.0
        Alamofire.request(baseUrl, method: methodType, parameters: params, encoding: encoding, headers: headers).responseJSON { response in
            if isObjectInitialized(response.data as AnyObject?) {
                let dataString = String(data: response.data!, encoding: String.Encoding.utf8)
                print("Response for  \(baseUrl)/ is  \n \(String(describing: dataString))  \(String(describing: response.response as AnyObject))")
            }

            switch response.result {
            case .success:
                if let statusCode = response.response?.statusCode {
                    if statusCode < 500 {
                        if isObjectInitialized(response.result.value as AnyObject?) {
                            completionHandler(.success, response.result.value! as AnyObject?)

                        } else {
                            completionHandler(.error(""), nil)
                        }
                    } else {
                        completionHandler(.error(""), nil)
                    }
                }
            case .failure:
                completionHandler(.error(""), nil)
            }
        }
    }

}

extension NetworkConnection {

    class func apiHeader() -> [String: String] {
		let headers = ["Content-Type": "application/json"]
        return headers
    }

    class func isInternetAvailable() -> Bool {
		let internetReach = Reachability(hostName: "google.com")
		internetReach?.stopNotifier()
		internetReach?.startNotifier()
		if internetReach?.currentReachabilityStatus().rawValue == 0 {
			return false
		} else {
			return true
		}
    }

    static func handleNetworkReachability() -> Bool {
        if !NetworkConnection.isInternetAvailable() {
            dispatchMainQueue({ () -> Void in
                return
            })
            return false
        } else {
            return true
        }
    }
}
