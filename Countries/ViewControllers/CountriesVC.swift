//
//  CountriesVC.swift
//  Countries
//
//  Created by harendra sharma on 14/04/20.
//  Copyright © 2020 harendra sharma. All rights reserved.
//

import UIKit

class CountriesVC: UIViewController {
    lazy var countryViewModel: CountryVM = {
        let viewModel = CountryVM()
        viewModel.delegate = self
        return viewModel

    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    // MARK: private Methods
    
    private func initialSetup() {
        self.registerNibs()
        
    }
    
    private func registerNibs (){
        
    }
    
    private func getCountries() {
        countryViewModel.getCountries(pharse: "india")
    }
}

extension CountriesVC: CountryVMDelegate  {
    func didReceived(_ countries: [Country]) {
        DispatchQueue.main.async {
            // TODO....
        }
    }
    func didFailed(withMessage message: String?) {
        // Handle case if anything goes wrong
    }
}
