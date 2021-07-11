//
//  EnvironmentUtils.swift
//  desafio
//
//  Created by Victor Valfre on 11/07/21.
//

import Foundation
public enum EnvironmentUtils {
    enum Keys {
        enum Plist {
            static let Enviroment = "Enviroment"
            static let BaseUrl = "BaseUrl"
        }
    }

    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()

    public static let Enviroment: String = {
    guard let value = EnvironmentUtils.infoDictionary[Keys.Plist.Enviroment] as? String else {
            fatalError("API Key not set in plist for this environment")
        }
        return value
    }()
    
    public static let BaseUrl: String = {
       guard let value = EnvironmentUtils.infoDictionary[Keys.Plist.BaseUrl] as? String else {
            fatalError("API Key not set in plist for this BaseUrl")
        }
        return "https://\(value)"
    }()
}
