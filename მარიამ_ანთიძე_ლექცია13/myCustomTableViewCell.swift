//
//  myCustomTableViewCell.swift
//  მარიამ_ანთიძე_ლექცია13
//
//  Created by Mariam Antidze on 21.11.22.
//

import UIKit

class myCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var customAgeLabel: UILabel!
    @IBOutlet weak var customSurnameLabel: UILabel!
    @IBOutlet weak var customNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
