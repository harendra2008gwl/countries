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

    // MARK: IBAction Methods

    @IBAction func actionBackBtn() {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func showCurrencyCodes() {
        if let codes = self.country?.currencies, codes.count > 0 {
            if let vc = Utility.getVC("CommonListVC") as? CommonListVC {
                vc.currencyCodes = codes
                vc.listType = .currencyCodes
                navigationController?.present(vc, animated: true, completion: nil)
            }
        } else {
            print("list is empty")
            // handle zero list case
        }
    }

    @IBAction func showCallingCodes() {
        if let codes = self.country?.callingCodes, codes.count > 0 {
            if let vc = Utility.getVC("CommonListVC") as? CommonListVC {
                vc.callingCodes = codes
                vc.listType = .callingCodes
                navigationController?.present(vc, animated: true, completion: nil)
            }
        } else {
            print("list is empty")
            // handle zero list case
        }
    }

    @IBAction func showTimeZones() {
        if let codes = self.country?.timezones, codes.count > 0 {
            if let vc = Utility.getVC("CommonListVC") as? CommonListVC {
                vc.timeZones = codes
                vc.listType = .timeZone
                navigationController?.present(vc, animated: true, completion: nil)
            }
        } else {
            print("list is empty")
            // handle zero list case
        }
    }

    @IBAction func showLanguages() {
        if let codes = self.country?.languages, codes.count > 0 {
            if let vc = Utility.getVC("CommonListVC") as? CommonListVC {
                vc.languageCodes = codes
                vc.listType = .languageCodes
                navigationController?.present(vc, animated: true, completion: nil)
            }
        } else {
            print("list is empty")
            // handle zero list case
        }
    }
}
