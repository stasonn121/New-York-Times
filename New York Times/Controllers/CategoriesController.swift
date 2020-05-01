//
//  CategoriesController.swift
//  New York Times
//
//  Created by user on 29.04.2020.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

class CategoriesController {
    let sections: [String]
    
    init() {
        self.sections = Sections().getSections()
    }
    
}
