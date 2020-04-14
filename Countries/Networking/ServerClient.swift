//
//  ServerClient.swift
//  Countries
//
//  Created by harendra sharma on 14/04/20.
//  Copyright © 2020 harendra sharma. All rights reserved.
//

import UIKit

enum endPoint {
    case countryNames

    var value: String {
        switch self {
        case .countryNames: return "name/"
        }
    }
}

class ServerClient: NSObject {
    // Globle access point
    static let shared: ServerClient = {
        ServerClient()
    }()

    private let baseURL = "https://restcountries.eu/rest/v2/"

    func request(_ endpoint: endPoint, pharse: String, completetionHandler: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        guard let url = URL(string: "\(baseURL)\(endpoint.value)\(pharse)") else {
            print("something went wrong")
            return
        }

        print("request URL::: \(url)")

        // create the session object
        let session = URLSession.shared

        // now create the URLRequest object using the url object
        let request = URLRequest(url: url)

        // create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, _, error in

            guard error == nil else {
                completetionHandler(nil, error)
                return
            }

            guard let data = data else {
                return
            }
            completetionHandler(data, nil)
            do {
                // create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [Any] {
                    print(json)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })

        task.resume()
    }
}
