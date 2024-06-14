//
//  TableViewCell.swift
//  TravelBookApp
//
//  Created by Zeynep Sinoğlu on 5.06.2024.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var shortDesc: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var img: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
