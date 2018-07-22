//
//  AppConfiguration.swift
//  Home24Demo
//
//  Created by Prince on 21/07/18.
//  Copyright © 2018 Home24Demo. All rights reserved.
//

import Foundation
/*
 Open your Project Build Settings and search for “Swift Compiler – Custom Flags” … “Other Swift Flags”.
 Add “-DDEVELOPMENT” to the Debug section
 Add “-DQA” to the QA section
 Add “-DSTAGING” to the Staging section
 Add “-DPRODUCTION” to the Release section
 */
enum Environment: String {
    case development
    case qa
    case staging
    case production

    /** w
     Returns application selected build configuration/environment

     - returns: An application selected build configuration/environment. Default is Development.
     */
    static func currentEnvironment() -> Environment {

        #if QA
            return Environment.qa
        #elseif STAGING
            return Environment.staging
        #elseif PRODUCTION
            return Environment.production
        #else // Default configuration - DEVELOPMENT
            return Environment.development
        #endif
    }
}

final class AppConfiguration {
    /**
     * Application Configuration
     */
    struct Configuration {
        var environment: Environment
        var apiEndPoint: String
        var analyticsKey: String

        fileprivate static func debugConfiguration() -> Configuration {
            return Configuration(environment: .development,
                                 apiEndPoint: "https://api-mobile.home24.com/api/v2.0",
                                 analyticsKey: "")
        }

        fileprivate static func qaConfiguration() -> Configuration {
            return Configuration(environment: .qa,
                                 apiEndPoint: "",
                                 analyticsKey: "")
        }

        fileprivate static func stagingConfiguration() -> Configuration {
            return Configuration(environment: .staging,
                                 apiEndPoint: "",
                                 analyticsKey: "")
        }

        fileprivate static func productionConfiguration() -> Configuration {
            return Configuration(environment: .production,
                                 apiEndPoint: "",
                                 analyticsKey: "")
        }
    }

    // MARK: - Singleton Instance
    class var shared: AppConfiguration {
        struct Singleton {
            static let instance = AppConfiguration()
        }
        return Singleton.instance
    }

    public private(set) var activeConfiguration: Configuration!

    private init() {
        // Load application selected environment and its configuration
        activeConfiguration = configurationForEnvironment(Environment.currentEnvironment())
    }

    /**
     Returns application active configuration

     - parameter environment: An application selected environment

     - returns: An application configuration structure based on selected environment
     */
    private func configurationForEnvironment(_ environment: Environment) -> Configuration {

        switch environment {
        case .development:
            return Configuration.debugConfiguration()
        case .qa:
            return Configuration.qaConfiguration()
        case .staging:
            return Configuration.stagingConfiguration()
        case .production:
            return Configuration.productionConfiguration()
        }
    }
}

extension AppConfiguration {

    func applicationEnvironment() -> String {
        return activeConfiguration.environment.rawValue
    }

    func applicationEndPoint() -> String {
        return activeConfiguration.apiEndPoint
    }

    func analyticsKey() -> String {
        return activeConfiguration.analyticsKey
    }
}
