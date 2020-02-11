//
//  SectionsViewModel.swift
//  Viaplay
//
//  Created by Sara Gharib on 2/10/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import Foundation

enum URLParameter: String {
    case dtg = "{?dtg}" //"{?dtg​}"
}

class SectionsViewModel {
    
    // MARK: - Properties
    
    private var sections = [Section]()
    
    // MARK: - Public Interfaces
    
    var sectionsCount: Int {
        return sections.count
    }
    
    // MARK: - Methods
    
    func fetchSection(completion: @escaping (_ success: Bool) -> Void) {
        DataManager.shared.getSections { [weak self] (sections) in
            guard let sections = sections else {
                return completion(false)
            }
            self?.sections = sections
            completion(true)
        }
    }
    
    func fetchSectionDetail(forSection section: Section, completion: @escaping (_ success: Bool) -> Void) {
        
        // If we already have sectionDetail, we don't need to fetch it again
        if let _ = section.sectionDetail {
            return completion(true)
        }
        
        
        guard let sectionURL = section.urlString else {
            return completion(false)
        }
        
        // Remove {?dtg} tag from URL
        let sectionDetailURL = sectionURL.deletingSuffix(URLParameter.dtg.rawValue)
        
        // Fetch sectionDetail
        DataManager.shared.getSectionDetail(sectionURL: sectionDetailURL) { (sectionDetail) in
            guard let sectionDetail = sectionDetail else {
                return completion(false)
            }
            section.sectionDetail = sectionDetail
            completion(true)
        }
    }
    
    func section(forIndex index: Int) -> Section {
        return sections[index]
    }
}
