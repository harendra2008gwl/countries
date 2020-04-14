//
//  CountryTblCell.swift
//  Countries
//
//  Created by harendra sharma on 14/04/20.
//  Copyright © 2020 harendra sharma. All rights reserved.
//

import SDWebImage
import SDWebImageSVGCoder
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
        name.text = country.name ?? ""

        if let urlString = country.flag {
            // register coder, on AppDelegate
            let SVGCoder = SDImageSVGCoder.shared
            SDImageCodersManager.shared.addCoder(SVGCoder)
            // load SVG url

            let bitmapSize = CGSize(width: 50, height: 50)
            flag.sd_setImage(with: URL(string: urlString), placeholderImage: Utility.loadingPlaceHolderImage, options: [], context: [.imageThumbnailPixelSize: bitmapSize])
        }
    }
}
