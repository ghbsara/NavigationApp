//
//  SectionDetailsViewModel.swift
//  Viaplay
//
//  Created by Sara Gharib on 2/10/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import Foundation

class SectionDetailsViewModel {
    
    // MARK: - Properties
    
    private var section: Section
    
    // MARK: - Public Interfaces
    
    var sectionName: String {
        return section.title ?? ""
    }
    
    var title: String {
        return section.sectionDetail?.title ?? ""
    }
    
    var description: String {
        return section.sectionDetail?.description ?? ""
    }
    
    // MARK: - Init
    
    init(section: Section) {
        self.section = section
    }
    
}
