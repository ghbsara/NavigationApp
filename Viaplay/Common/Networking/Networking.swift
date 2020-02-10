//
//  Networking.swift
//  Viaplay
//
//  Created by Sara Gharib on 2/10/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import Foundation

class Networking {
    
    // Fetch data using the url string
    static func fetchData(urlString: String, completionHandler: @escaping (_ data: Data?,_ error: Error?) -> Void) {
         
        guard let url = URL(string: urlString) else {
            return completionHandler(nil, nil)
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            completionHandler(data, error)
        }
        
        task.resume()
    }
}
