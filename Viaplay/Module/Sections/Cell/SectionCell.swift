//
//  SectionCell.swift
//  Viaplay
//
//  Created by Sara Gharib on 2/11/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import UIKit

class SectionCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let reuseIdentifier = "SectionCell"
    
    // MARK: - Views
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Configure
    
    func configure(withTitle title: String) {
        titleLabel.text = title
    }
}
