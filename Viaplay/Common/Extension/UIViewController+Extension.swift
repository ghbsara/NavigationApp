//
//  UIViewController+Extension.swift
//  Viaplay
//
//  Created by Sara Gharib on 2/11/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showNetworkAlert() {
        let alert = UIAlertController(title: "Network Error", message: "The network is currently unavailable. Please check your cellular network settings, or try again later.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
