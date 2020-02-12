//
//  Networking.swift
//  Viaplay
//
//  Created by Sara Gharib on 2/10/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import Foundation

enum ViaplayError {
    case networkError
    case urlError
    case requestError
    case sqLiteError
}

class Networking {
    
    // Fetch data using the url string
    static func fetchData(urlString: String, completionHandler: @escaping (_ data: Data?,_ error: ViaplayError?) -> Void) {
        
        guard Reachability.isConnectedToNetwork() else { return completionHandler(nil, .networkError) }
        
        guard let url = URL(string: urlString) else {
            return completionHandler(nil, .urlError)
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    
            if error != nil {
                completionHandler(data, .requestError)
            } else {
                completionHandler(data, nil)
            }
        }
        
        task.resume()
    }
}
