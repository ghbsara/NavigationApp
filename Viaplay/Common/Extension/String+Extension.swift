//
//  String+Extension.swift
//  Viaplay
//
//  Created by Sara Gharib on 2/11/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import Foundation

extension String {
    
    func deletingSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else {
            return self
        }
        return String(self.dropLast(suffix.count))
    }
}
