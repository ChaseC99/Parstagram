//
//  PostCell.swift
//  Parstagram
//
//  Created by Chase Carnaroli on 2/17/19.
//  Copyright © 2019 Chase Carnaroli. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
