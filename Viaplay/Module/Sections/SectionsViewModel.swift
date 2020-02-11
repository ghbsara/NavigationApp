//
//  SectionsViewModel.swift
//  Viaplay
//
//  Created by Sara Gharib on 2/10/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import Foundation

class SectionsViewModel {
    
    // MARK: - Properties
    
    private var sections = [Section]()
    
    // MARK: - Public Interfaces
    
    var sectionsCount: Int {
        return sections.count
    }
    
    // MARK: - Methods
    
    func fetchSections(completion: @escaping (_ success: Bool, _ error: Error?) -> Void) {
        DataManager.shared.getSections { [weak self] (sections, error) in
            guard let sections = sections else {
                return completion(false, error)
            }
            self?.sections = sections
            completion(true, nil)
        }
    }
    
    func fetchSectionDetail(forSection section: Section, completion: @escaping (_ success: Bool, _ error: Error?) -> Void) {
        
        // If we already have sectionDetail, we don't need to fetch it again
        if let _ = section.sectionDetail {
            return completion(true, nil)
        }
        
        // Fetch sectionDetail
        DataManager.shared.getSectionDetail(section: section) { (sectionDetail, error) in
            guard let sectionDetail = sectionDetail else {
                return completion(false, error)
            }
            section.sectionDetail = sectionDetail
            completion(true, error)
        }
    }
    
    func section(forIndex index: Int) -> Section {
        return sections[index]
    }
}
