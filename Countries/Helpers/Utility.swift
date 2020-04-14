//
//  Utility.swift
//  Countries
//
//  Created by harendra sharma on 15/04/20.
//  Copyright © 2020 harendra sharma. All rights reserved.
//

import Foundation
import UIKit

class Utility: NSObject {
    static let loadingPlaceHolderImage = UIImage(named: "loading")!
    
    class func getVC(_ identifier: String) -> Any {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: identifier)
        return vc
    }
}

