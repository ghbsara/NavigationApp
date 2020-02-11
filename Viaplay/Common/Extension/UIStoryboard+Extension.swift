//
//  UIStoryboard+Extension.swift
//  Viaplay
//
//  Created by Sara Gharib on 2/11/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import UIKit

enum Storyboard : String {
    case main = "Main"
}

extension UIStoryboard {
    
    static func load(from storyboard: Storyboard, viewController: UIViewController.Type) -> UIViewController {
           let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
           return uiStoryboard.instantiateViewController(withIdentifier: String(describing: viewController.self))
    }
}
