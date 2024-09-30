//
//  SelectPostController.swift
//  New York Times
//
//  Created by user on 29.04.2020.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

protocol SelectPostControllerDelegate: AnyObject {
    func selectPostController(_ controller: SelectPostController, request: URLRequest)
}

class SelectPostController {
    var post: Post?
    weak var delegate: SelectPostControllerDelegate?
    
    init() { }
    
    func getRequest() {
        guard let selectPost = self.post,
            let myURL = URL(string: selectPost.descriptionURL) else { return }
        
        let request = URLRequest(url: myURL)
        delegate?.selectPostController(self, request: request)
    }

}
