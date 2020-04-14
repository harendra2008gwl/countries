//
//  CountriesVC.swift
//  Countries
//
//  Created by harendra sharma on 14/04/20.
//  Copyright © 2020 harendra sharma. All rights reserved.
//

import UIKit

class CountriesVC: UIViewController {
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var countryListTbl: UITableView!
    private var countryList: [Country]?
    private let cellId = "CountryTblCell"

    lazy var countryViewModel: CountryVM = {
        let viewModel = CountryVM()
        viewModel.delegate = self
        return viewModel

    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

    // MARK: private Methods

    private func initialSetup() {
        registerNibs()
        searchBar.delegate = self
        searchBar.showsCancelButton = false
        countryListTbl.delegate = self
        countryListTbl.dataSource = self
        countryListTbl.estimatedRowHeight = 60.0
        countryListTbl.rowHeight = UITableView.automaticDimension
        countryListTbl.keyboardDismissMode = .onDrag
    }

    private func registerNibs() {
        countryListTbl.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }

    @objc private func getCountries() {
        countryViewModel.getCountries(pharse: searchBar.text ?? "")
    }
}

extension CountriesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countryList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CountryTblCell, let list = self.countryList else {
            print("cell cannot be loaded")
            return UITableViewCell()
        }

        cell.configure(list[indexPath.row])
        return cell
    }
}

extension CountriesVC: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = false
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 0 {
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(getCountries), object: self)

            perform(#selector(getCountries), with: self, afterDelay: 0.35)

        } else {
            // handle refresh table for empty search fiel
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.showsCancelButton = false
        view.endEditing(true)
        countryList = nil
        countryListTbl.reloadData()
    }
}

extension CountriesVC: CountryVMDelegate {
    func didReceived(_ countries: [Country]) {
        DispatchQueue.main.async {
            self.countryList?.removeAll()
            self.countryList = countries
            self.countryListTbl.reloadData()
        }
    }

    func didFailed(withMessage message: String?) {
        // Handle case if anything goes wrong
    }
}
