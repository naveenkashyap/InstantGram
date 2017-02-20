//
//  HomeTableViewCell.swift
//  InstantGram
//
//  Created by Naveen Kashyap on 2/19/17.
//  Copyright © 2017 Naveen Kashyap. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postImageView: PFImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    var post: PFObject! {
        didSet {
            self.postImageView.file = post["media"] as? PFFile
            print((self.postImageView.file)! as PFFile)
            self.postImageView.loadInBackground()
            self.captionLabel.text = post["caption"] as? String
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        postImageView.image = #imageLiteral(resourceName: "NoPicture")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
