//
//  CurrencyCodeCell.swift
//  Countries
//
//  Created by harendra sharma on 15/04/20.
//  Copyright © 2020 harendra sharma. All rights reserved.
//

import UIKit

class CurrencyCodeCell: UITableViewCell {
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblCode: UILabel!
    @IBOutlet var lblSymbol: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(_ currency: Currency) {
        lblName.text = "Name: \(currency.name ?? "")"
        lblCode.text = "Code: \(currency.code ?? "")"
        lblSymbol.text = "Symbol: \(currency.symbol ?? "")"
    }
}
