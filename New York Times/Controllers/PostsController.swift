//
//  Categories.swift
//  New York Times
//
//  Created by user on 29.04.2020.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

protocol PostsControllerDelegate: class {
    func postsController(_ controller: PostsController, didReceive posts: [Post])
    func postsController(_ controller: PostsController, didReceive imageURL: URL, cell: PostTableViewCell)
}

class PostsController {
    let provider: NYTimesProvider
    var section: String?
    var post: Post?
    weak var delegate: PostsControllerDelegate?
    
    init(provider: NYTimesProvider) {
        self.provider = provider
    }
    
    func searchItems() {
        provider.getPosts(section: section!, completion: {[weak self] result in
        guard let self = self else { return }
            switch result {
            case .success(let posts):
                self.delegate?.postsController(self, didReceive: posts)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func setImageURL(imageURL: String, cell: PostTableViewCell) {
        guard let url = URL(string: imageURL) else { return }
        self.delegate?.postsController(self, didReceive: url, cell: cell)
    }
}
