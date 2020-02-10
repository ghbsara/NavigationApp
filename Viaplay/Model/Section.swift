//
//  Section.swift
//  Viaplay
//
//  Created by Sara Gharib on 2/10/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import Foundation

class Section: Decodable {
    
    // MARK: - Properties
    
    let title: String?
    let urlString: String?
    
    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case urlString = "href"
        case title
    }
    
    // MARK: - Init
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try container.decode(String.self, forKey: .title)
        urlString = try container.decode(String.self, forKey: .urlString)
    }
}
