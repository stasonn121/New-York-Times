//
//  SelectPostViewController.swift
//  New York Times
//
//  Created by user on 29.04.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class SelectPostViewController: UIViewController {

    let selectPostController = SelectPostController()
    @IBOutlet weak var postView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectPostController.delegate = self
        selectPostController.getRequest()
    }
    
}

extension SelectPostViewController: SelectPostControllerDelegate {
    func selectPostController(_ controller: SelectPostController, request: URLRequest) {
        postView.loadRequest(request)
    }
}
