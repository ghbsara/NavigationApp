//
//  DataManager.swift
//  Viaplay
//
//  Created by Sara Gharib on 2/10/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import Foundation

enum URLParameter: String {
    case dtg = "{?dtg}"
}

class DataManager {
    
    static let shared = DataManager()
    
    func getSections(completionHandler: @escaping (_ sections: [Section]?,_ error: ViaplayError?) -> Void) {
        
        Networking.fetchData(urlString: viaplayURL) { (data, error) in
            
            if let _ = error {
                SQLiteManager.shared.fetchSections { (sections, error) in
                    completionHandler(sections, error)
                }
            } else {
                guard let data = data else {
                    return completionHandler(nil, nil)
                }
                
                do {
                    let root = try JSONDecoder().decode(Root.self, from: data)
                    completionHandler(root.link?.sections, nil)
                    guard let sections = root.link?.sections else { return }
                    SQLiteManager.shared.createDataBase()
                    SQLiteManager.shared.insertSections(sections: sections)
                    
                } catch {
                    print("error")
                    completionHandler(nil, .sqLiteError)
                }
            }
        }
    }
    
    func getSectionDetail(section: Section, completionHandler: @escaping (_ section: SectionDetail?, _ error: ViaplayError?) -> Void) {
        
        guard let sectionURL = section.urlString else {
            return completionHandler(nil, nil)
        }
        // Remove {?dtg} tag from URL
        let sectionDetailURL = sectionURL.deletingSuffix(URLParameter.dtg.rawValue)
        
        Networking.fetchData(urlString: sectionDetailURL) { (data, error) in
            guard let data = data else {
                return completionHandler(nil, error)
            }
            
            do {
                let sectionDetail = try JSONDecoder().decode(SectionDetail.self, from: data)
                completionHandler(sectionDetail, error)
                SQLiteManager.shared.updateSection(section: section)
            } catch {
                print("error")
                completionHandler(nil, .sqLiteError)
            }
        }
    }
}
