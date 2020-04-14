//
//  CountryVM.swift
//  Countries
//
//  Created by harendra sharma on 14/04/20.
//  Copyright © 2020 harendra sharma. All rights reserved.
//

import UIKit

// Delegates for CountryVM
protocol CountryVMDelegate {
    func didReceived(_ countries: [Country])
    func didFailed(withMessage message: String?)
}

// Make CountryVMDelegate's methods optional
extension CountryVMDelegate {
    func didReceived(_ countries: [Country]) {}
    func didFailed(withMessage message: String?) {}
}

class CountryVM: NSObject {
    var delegate: CountryVMDelegate?

    func getCountries(pharse: String) {
        ServerClient.shared.request(.countryNames, pharse: pharse, completetionHandler: { result, error in
            // --- Failed -- //

            if error != nil {
                print("Error: \(error?.localizedDescription ?? "something went wrong")")
                self.delegate?.didFailed(withMessage: error?.localizedDescription ?? "something went wrong")
            }

            // --- Success -- //

            if let data = result {
                guard let countries = try? JSONDecoder().decode([Country].self, from: data) else {
                    print("Error: \(error?.localizedDescription ?? "something went wrong")")
                    self.delegate?.didFailed(withMessage: "countries are Nil")
                    return
                }
                print("found countries: \(countries)")
                self.delegate?.didReceived(countries)
            }

        })
    }
}
