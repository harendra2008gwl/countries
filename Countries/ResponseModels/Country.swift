//
//  Country.swift
//  Countries
//
//  Created by harendra sharma on 14/04/20.
//  Copyright © 2020 harendra sharma. All rights reserved.
//

import UIKit

//MARK: Country object
struct Country: Codable {
    var name: String?
    var region: String?
    var flag: String?
    var capital: String?
    var subregion: String?
    var callingCodes: [String]?
    var timezones: [String]?
    var languages: [Language]?
    var currencies: [Currency]?

    enum CodingKeys: String, CodingKey {
        case name
        case region
        case flag
        case capital
        case subregion
        case callingCodes
        case timezones
        case languages
        case currencies
    }
}

//MARK: Language object
struct Language: Codable {
    var iso639_1: String?
    var iso639_2: String?
    var name: String?
    var nativeName: String?

    enum CodingKeys: String, CodingKey {
        case iso639_1
        case iso639_2
        case name
        case nativeName
    }
}

//MARK: Currency object
struct Currency: Codable {
    var code: String?
    var name: String?
    var symbol: String?

    enum CodingKeys: String, CodingKey {
        case code
        case name
        case symbol
    }
}
