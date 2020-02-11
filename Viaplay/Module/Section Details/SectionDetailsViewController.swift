//
//  SectionDetailsViewController.swift
//  Viaplay
//
//  Created by Sara Gharib on 2/10/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import UIKit

class SectionDetailsViewController: UIViewController {
    
    // MARK: - Views
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Properties
    
    var viewModel: SectionDetailsViewModel!
    
    // MARK: - Init
    
    static func instantiate(viewModel: SectionDetailsViewModel) -> SectionDetailsViewController {
        
        let viewController = UIStoryboard.load(from: .main, viewController: self) as! SectionDetailsViewController
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        navigationController?.navigationBar.topItem?.title = viewModel.sectionName
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
    }
}
