//
//  CommonListVC.swift
//  Countries
//
//  Created by harendra sharma on 15/04/20.
//  Copyright © 2020 harendra sharma. All rights reserved.
//

import UIKit

class CommonListVC: UIViewController {
    @IBOutlet var commonTble: UITableView!
    @IBOutlet var LblHeaderTitle: UILabel!

    private let countryCodeCell = "CountryCodeCell"
    private let currencyCodeCell = "CurrencyCodeCell"
    private let timeZoneCell = "TimeZoneCell"
    private let languageCell = "LanguageCell"

    var timeZones: [String]?
    var callingCodes: [String]?
    var currencyCodes: [Currency]?
    var languageCodes: [Language]?

    let listType: CommonListType = .callingCodes

    private var countryList: [Country]?

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

    // MARK: private Methods

    private func initialSetup() {
        registerNibs()
        commonTble.delegate = self
        commonTble.dataSource = self
        commonTble.estimatedRowHeight = 60.0
        commonTble.rowHeight = UITableView.automaticDimension
        commonTble.keyboardDismissMode = .onDrag
    }

    private func registerNibs() {
        commonTble.register(UINib(nibName: countryCodeCell, bundle: nil), forCellReuseIdentifier: countryCodeCell)
        commonTble.register(UINib(nibName: currencyCodeCell, bundle: nil), forCellReuseIdentifier: currencyCodeCell)

        commonTble.register(UINib(nibName: timeZoneCell, bundle: nil), forCellReuseIdentifier: timeZoneCell)

        commonTble.register(UINib(nibName: languageCell, bundle: nil), forCellReuseIdentifier: languageCell)
    }

    @IBAction func actionBackBtn() {
        dismiss(animated: true, completion: nil)
    }
}

extension CommonListVC: UITableViewDelegate, UITableViewDataSource {
    // MARK: UITableView Delegate and DataSource Methods

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch listType {
        case .callingCodes:
            return 44.0
        case .currencyCodes:
            return 100.0
        case .timeZone:
            return 44.0
        case .languageCodes:
            return 100.0
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch listType {
        case .callingCodes:
            return callingCodes?.count ?? 0
        case .currencyCodes:
            return currencyCodes?.count ?? 0
        case .timeZone:
            return timeZones?.count ?? 0
        case .languageCodes:
            return languageCodes?.count ?? 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch listType {
        case .callingCodes:

            guard let cell = tableView.dequeueReusableCell(withIdentifier: countryCodeCell, for: indexPath) as? CountryCodeCell, let list = self.callingCodes else {
                print("cell cannot be loaded")
                return UITableViewCell()
            }

            cell.configure(list[indexPath.row])
            return cell

        case .currencyCodes:

            guard let cell = tableView.dequeueReusableCell(withIdentifier: currencyCodeCell, for: indexPath) as? CurrencyCodeCell, let list = self.currencyCodes else {
                print("cell cannot be loaded")
                return UITableViewCell()
            }
            cell.configure(list[indexPath.row])
            return cell

        case .timeZone:

            guard let cell = tableView.dequeueReusableCell(withIdentifier: timeZoneCell, for: indexPath) as? TimeZoneCell, let list = self.timeZones else {
                print("cell cannot be loaded")
                return UITableViewCell()
            }

            cell.configure(list[indexPath.row])
            return cell

        case .languageCodes:

            guard let cell = tableView.dequeueReusableCell(withIdentifier: languageCell, for: indexPath) as? LanguageCell, let list = self.languageCodes else {
                print("cell cannot be loaded")
                return UITableViewCell()
            }
            cell.configure(list[indexPath.row])
            return cell
        }
    }
}
