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
        
        progressIndicator.startAnimating()
        
        viewModel.fetchSection { [weak self] (success) in
            if success {
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.progressIndicator.stopAnimating()
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
        let cell = configureStationCell(item: section)
        return cell
    }
    
    // MARK: - Local Helpers
    
    private func configureStationCell(item: Section) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SectionCell.reuseIdentifier) as? SectionCell else {
            return UITableViewCell()
        }
        
        cell.configure(withTitle: item.title ?? "")
        
        return cell
    }
}

// MARK: - TableView Delegate Extension Methods

extension SectionsViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        guard let viewModel = viewModel else { return }
//
//        // Get the selected item
//        let selectedItem = viewModel.items[indexPath.row]
//
//        // Switch on Sections
//        switch selectedItem.type {
//        case .hours:
//            handleStationHoursTap(selectedItem, indexPath)
//        default:
//            break
//        }
//    }
//
//    // MARK: - Local Helpers
//
//    fileprivate func handleStationHoursTap(_ item: StationDetailsModelItem, _ indexPath: IndexPath) {
//
//        guard let cell = tableView.cellForRow(at: indexPath) as? StationHoursCell else {
//            return
//        }
//        self.currentScrollPosition = self.tableView.contentOffset.y
//        tableView.beginUpdates()
//        cell.isExpended.toggle()
//        tableView.endUpdates()
//        self.currentScrollPosition = nil
//        self.tableView.layoutIfNeeded()
//        tableView.scrollToRow(at: IndexPath(row: indexPath.row, section: 0), at: .middle, animated: true)
//    }
}
