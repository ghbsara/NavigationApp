//
//  SectionDetail.swift
//  Viaplay
//
//  Created by Sara Gharib on 2/11/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import Foundation

class SectionDetail: Decodable {
    
    // MARK: - Properties
    
    let title: String?
    let description: String?
    
    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
    }
    
    // MARK: - Init
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
    }
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}
