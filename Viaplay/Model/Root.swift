//
//  Root.swift
//  Viaplay
//
//  Created by Sara Gharib on 2/10/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import Foundation

struct Root: Decodable {
    
    // MARK: - Properties
    
    let link: Link?
    
    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case link = "_links"
    }
    
    // MARK: - Init
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        link = try container.decode(Link.self, forKey: .link)
    }
}
