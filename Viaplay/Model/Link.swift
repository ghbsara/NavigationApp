//
//  Link.swift
//  Viaplay
//
//  Created by Sara Gharib on 2/10/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import Foundation

class Link: Decodable {
    
    // MARK: - Properties
    
    let sections: [Section]?
    
    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case section = "viaplay:sections"
    }
    
    // MARK: - Init
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        sections = try container.decode([Section].self, forKey: .section)
    }
}
