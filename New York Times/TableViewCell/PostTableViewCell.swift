//
//  PostTableViewCell.swift
//  New York Times
//
//  Created by user on 30.04.2020.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        postImageView.layer.cornerRadius = 10
        self.layer.cornerRadius = 15
        self.layer.shadowColor = .init(srgbRed: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowRadius = 30
        self.layer.shadowOpacity = 2
        self.layer.shadowOffset = .zero
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
