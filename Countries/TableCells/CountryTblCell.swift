//
//  CountryTblCell.swift
//  Countries
//
//  Created by harendra sharma on 14/04/20.
//  Copyright © 2020 harendra sharma. All rights reserved.
//

import UIKit

class CountryTblCell: UITableViewCell {

    @IBOutlet var name: UILabel!
    @IBOutlet var flag: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ country: Country) {
        self.name.text = country.name ?? ""
    }
}
