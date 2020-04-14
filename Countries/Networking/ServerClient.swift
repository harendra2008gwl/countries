//
//  ServerClient.swift
//  Countries
//
//  Created by harendra sharma on 14/04/20.
//  Copyright © 2020 harendra sharma. All rights reserved.
//

import UIKit

enum endPoint {
    case countryNames

    var value: String {
        switch self {
        case .countryNames: return "name/"
        }
    }
}

class ServerClient: NSObject {
    //Globle access point
    static let shared: ServerClient = {
        ServerClient()
    }()
    private let baseURL = "https://restcountries.eu/rest/v2/"
    
    
    
}
