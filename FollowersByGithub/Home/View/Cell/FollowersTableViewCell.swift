//
//  FollowersTableViewCell.swift
//  FollowersByGithub
//
//  Created by Kevinho Morales on 5/1/22.
//

import UIKit

class FollowersTableViewCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static let CELL_ID = "FOLLOWERS_CELL"

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setUpCell(follower: Followers) {
        usernameLabel.text = follower.login
        idLabel.text = "\(follower.id)"
        userImageView.loadImageUsingCacheWithURLString(follower.avatar_url, placeHolder: nil)
    }
    
}
