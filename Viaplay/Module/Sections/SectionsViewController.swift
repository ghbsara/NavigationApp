//
//  ViewController.swift
//  Viaplay
//
//  Created by Sara Gharib on 2/10/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import UIKit

class SectionsViewController: UIViewController {
    
    // MARK: - Views
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    
    var viewModel = SectionsViewModel()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        updateUI()
    }
    
    // MARK: - Setup
    
    private func setupTableView() {
        
        // Register Cells
        tableView.register(UINib(nibName: SectionCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: SectionCell.reuseIdentifier)
    }
    
    private func updateUI() {
        
        navigationController?.navigationBar.topItem?.title = "Sections"
        
        progressIndicator.startAnimating()
        
        viewModel.fetchSections { [weak self] (success, error) in
            DispatchQueue.main.async {
                self?.progressIndicator.stopAnimating()
                if success {
                    self?.tableView.reloadData()
                    
                } else {
                    // Show network error if there is no data in DB
                    self?.showNetworkAlert()
                }
            }
        }
    }
}

// MARK: - TableView DataSource Extension Methods

extension SectionsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.sectionsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = viewModel.section(forIndex: indexPath.row)
        let cell = configureSectionCell(item: section)
        return cell
    }
    
    // MARK: - Local Helpers
    
    private func configureSectionCell(item: Section) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SectionCell.reuseIdentifier) as? SectionCell else {
            return UITableViewCell()
        }
        
        cell.configure(withTitle: item.title ?? "")
        
        return cell
    }
}

// MARK: - TableView Delegate Extension Methods

extension SectionsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Get the selected item
        let selectedItem = viewModel.section(forIndex: indexPath.row)
        
        // Show SectionDetails screen
        handleSectionTap(selectedItem)
    }
    
    // MARK: - Local Helpers
    
    private func handleSectionTap(_ item: Section) {
        
        progressIndicator.startAnimating()
        
        // Fetch Section details, and show details screen
        viewModel.fetchSectionDetail(forSection: item) { [weak self] (success, error) in
            DispatchQueue.main.async {
                self?.progressIndicator.stopAnimating()
                if success {
                    
                    let viewController = SectionDetailsViewController.instantiate(viewModel: SectionDetailsViewModel(section: item))
                    self?.navigationController?.pushViewController(viewController, animated: true)
                } else {
                    // Show network error if there is no data in DB
                    self?.showNetworkAlert()
                }
            }
        }
    }
}
