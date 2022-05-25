//
//  myTableViewCell.swift
//  iOS Settings
//
//  Created by Xavier Li on 5/22/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var myItemLabel: UILabel!
    
    @IBOutlet weak var myItemImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
