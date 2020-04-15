//
//  CountryCodeCell.swift
//  Countries
//
//  Created by harendra sharma on 15/04/20.
//  Copyright © 2020 harendra sharma. All rights reserved.
//

import UIKit

class CountryCodeCell: UITableViewCell {
    @IBOutlet var lblCode: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ code: String) {
        lblCode.text = "Calling Code: \(code)"
        
    }
}
