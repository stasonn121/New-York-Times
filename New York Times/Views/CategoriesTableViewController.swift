//
//  CategoriesTableVC.swift
//  New York Times
//
//  Created by user on 28.04.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import Alamofire
import SWXMLHash

class CategoriesTableVC: UITableViewController {

    var nameSelect: String?
    var categoriesController = CategoriesController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return categoriesController.sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = categoriesController.sections[indexPath.section]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        nameSelect = cell.textLabel?.text
        performSegue(withIdentifier: "allPosts", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "allPosts",
            let vc = segue.destination as? PostsTableViewController,
            let titleSelectSection = nameSelect else { return }
        vc.postsController.section = titleSelectSection
    }
    
}


