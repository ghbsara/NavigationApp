//
//  UIViewController+Extension.swift
//  Viaplay
//
//  Created by Sara Gharib on 2/11/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(forError error: ViaplayError) {
        var message = "Please try again later."
        if error == .networkError {
            message = "The network is currently unavailable. Please check your cellular network settings, or try again later."
        }
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
