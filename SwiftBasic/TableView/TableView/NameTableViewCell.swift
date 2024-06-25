//
//  NameTableViewCell.swift
//  TableView
//
//  Created by Vaibhav Sharma on 27/05/24.
//

import UIKit

class NameTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateCell(name : String) {
        lblName.text = name
    }

}
