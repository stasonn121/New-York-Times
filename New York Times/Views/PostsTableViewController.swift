//
//  PostsViewController.swift
//  New York Times
//
//  Created by user on 28.04.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import SDWebImage

class PostsTableViewController: UITableViewController {

    var postsController = PostsController(provider: AppDelegate.restProvider)
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView?.backgroundColor = .clear
        postsController.delegate = self
        postsController.searchItems()
    }

    // MARK: - Table view data sources

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return posts.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostTableViewCell
        
        let imageURL = posts[indexPath.section].imageURL
        postsController.setImageURL(imageURL: imageURL, cell: cell)
        cell.titleLabel?.text = posts[indexPath.section].title
        cell.descriptionLabel.text = posts[indexPath.section].description

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        postsController.post = posts[indexPath.section]
        performSegue(withIdentifier: "selectPost", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .clear
        return header
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "selectPost",
            let vc = segue.destination as? SelectPostViewController else { return }
        vc.selectPostController.post = postsController.post
    }
}

extension PostsTableViewController: PostsControllerDelegate {
    
    func postsController(_ controller: PostsController, didReceive imageURL: URL, cell: PostTableViewCell) {
        
        cell.postImageView?.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "clock"), options: .continueInBackground, completed: nil)
    }
    
    func postsController(_ controller: PostsController, didReceive posts: [Post]) {
        self.posts = posts
        tableView.reloadData()
    }
}
