//
//  DataManager.swift
//  Viaplay
//
//  Created by Sara Gharib on 2/10/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    func getSections(completionHandler: @escaping (_ sections: [Section]?) -> Void) {
        
        Networking.fetchData(urlString: viaplayURL) { (data, error) in
            guard let data = data else {
                return completionHandler(nil)
            }
            
            do {
                let root = try JSONDecoder().decode(Root.self, from: data)
                completionHandler(root.link?.sections)
            } catch {
               print("error")
               completionHandler(nil)
            }
        }
    }
}
