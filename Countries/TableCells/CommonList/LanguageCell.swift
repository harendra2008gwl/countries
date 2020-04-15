//
//  LanguageCell.swift
//  Countries
//
//  Created by harendra sharma on 15/04/20.
//  Copyright © 2020 harendra sharma. All rights reserved.
//

import UIKit

class LanguageCell: UITableViewCell {
      @IBOutlet var lblName: UILabel!
       @IBOutlet var lbliso639_1: UILabel!
       @IBOutlet var lbliso639_2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    func configure(_ language: Language) {
           lblName.text = "Name: \(language.name ?? "")"
           lbliso639_1.text = "ISO_1: \(language.iso639_1 ?? "")"
           lbliso639_2.text = "ISO_2: \(language.iso639_2 ?? "")"
       }
}
