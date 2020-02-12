//
//  SQLiteManager.swift
//  Viaplay
//
//  Created by Sara Gharib on 2/11/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import SQLite

class SQLiteManager {
    
    static var shared = SQLiteManager()
    
    private var db: Connection?
    private var dbPath = (NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
        ).first ?? "") + "/viaplay.sqlite3"
    private let sectionsTable = Table("sections")
    private let id = Expression<String>("id")
    private let page = Expression<String>("page")
    private let title = Expression<String>("title")
    private let url = Expression<String>("url")
    private let description = Expression<String>("description")
    
    func createDataBase() {
        
        do {
            db = try Connection(dbPath)
            
            guard let db = db else { return }
            
            try db.run(sectionsTable.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(page)
                table.column(title)
                table.column(description)
                table.column(url)
            })
        } catch {
            print("Connection Error : \(error)")
        }
    }
    
    func insertSections(sections: [Section]) {
        
        if db == nil {
            do {
                db = try Connection(dbPath)
            } catch {
                print("Connection Error: \(error)")
            }
        }
        
        do {
            guard let db = db else { return }
            try db.run(sectionsTable.delete())
        } catch  {
            print("delete all failed: \(error)")
        }
        
        for section in sections {
            let insert = sectionsTable.insert(id <- section.id ?? "", page <- section.title ?? "", title <- section.sectionDetail?.title ?? "", description <- section.sectionDetail?.description ?? "", url <- section.urlString ?? "")
            guard let db = db else { return }
            do {
                try db.run(insert)
            } catch {
                print("Sections insert Error: \(error)")
            }
        }
    }
    
    func fetchSections(completion: @escaping (_ sections: [Section]?,_ error: ViaplayError?) -> Void) {
        
        if db == nil {
            do {
                db = try Connection(dbPath)
            } catch {
                completion(nil, .sqLiteError)
                print("Connection Error")
            }
        }
        
        do {
            guard let db = db else { return completion(nil, nil) }
            let rows = Array(try db.prepare(sectionsTable))
            var sections = [Section]()
            for row in rows {
                let section = Section(id: try row.get(id), page: try row.get(page), urlString: try row.get(url), title: try row.get(title), description: try row.get(description))
                sections.append(section)
            }
            completion(sections, nil)
        } catch {
            completion(nil, .sqLiteError)
            print("Fetch data failed: \(error)")
        }
    }
    
    func updateSection(section: Section) {
        
        if db == nil {
            do {
                db = try Connection(dbPath)
            } catch {
                print("Connection Error: \(error)")
            }
        }
        
        let filteredSection = sectionsTable.filter(id == section.id ?? "")
        let update = filteredSection.update(title <- section.sectionDetail?.title ?? "", description <- section.sectionDetail?.description ?? "")
        guard let db = db else { return }
        do {
            try db.run(update)
        } catch {
            print("Update failed: \(error)")
        }
    }
}
