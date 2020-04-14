//
//  Country.swift
//  Countries
//
//  Created by harendra sharma on 14/04/20.
//  Copyright © 2020 harendra sharma. All rights reserved.
//

import UIKit

struct Country: Codable {
    var name: String?
    var region: String?
    var flag: String?
    var capital: String?
    var subregion: String?
    var callingCodes: [String]?
    var timezones: [String]?

    enum CodingKeys: String, CodingKey {
        case name
        case region
        case flag
        case capital
        case subregion
        case callingCodes
        case timezones
    }
}
