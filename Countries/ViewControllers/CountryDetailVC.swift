//
//  CountryDetailVC.swift
//  Countries
//
//  Created by harendra sharma on 15/04/20.
//  Copyright © 2020 harendra sharma. All rights reserved.
//

import SDWebImageSVGCoder
import UIKit

class CountryDetailVC: UIViewController {
    @IBOutlet var flag: UIImageView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblCapital: UILabel!
    @IBOutlet var lblCallingCodes: UILabel!
    @IBOutlet var lblRegion: UILabel!
    @IBOutlet var lblSubRegion: UILabel!

    var country: Country?

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

    // MARK: private Methods

    private func initialSetup() {
        lblName.text = "Name: \(country?.name ?? "")"
        lblCapital.text = "Capital: \(country?.capital ?? "")"
        lblRegion.text = "Region: \(country?.region ?? "")"
        lblSubRegion.text = "Sub-Region: \(country?.subregion ?? "")"

        if let urlString = country?.flag {
            // register coder, on AppDelegate
            let SVGCoder = SDImageSVGCoder.shared
            SDImageCodersManager.shared.addCoder(SVGCoder)
            // load SVG url
            let bitmapSize = CGSize(width: 150, height: 150)
            flag.sd_setImage(with: URL(string: urlString), placeholderImage: Utility.loadingPlaceHolderImage, options: [], context: [.imageThumbnailPixelSize: bitmapSize])
        }
    }

    @IBAction func actionBackBtn() {
        navigationController?.popViewController(animated: true)
    }
}
