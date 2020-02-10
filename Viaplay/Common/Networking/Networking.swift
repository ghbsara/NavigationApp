//
//  Networking.swift
//  Viaplay
//
//  Created by Sara Gharib on 2/10/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import Foundation

class Networking {
    
    static func fetchData(url: URL, completionHandler: @escaping (_ data: Data?,_ error: Error?) -> Void) {
                
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            completionHandler(data, error)
        }
        
        task.resume()
    }
}
