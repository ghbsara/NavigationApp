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
    
    func fetchSection(completion: @escaping (_ success: Bool) -> Void) {
        DataManager.shared.getSections { [weak self] (sections) in
            guard let sections = sections else {
                return completion(false)
            }
            self?.sections = sections
            completion(true)
        }
    }
    
    func section(forIndex index: Int) -> Section {
        return sections[index]
    }
}
