//
//  DataTableViewCell.swift
//  LoadDataInTableViewMVVM
//
//  Created by Vaibhav Sharma on 15/05/24.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgName: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblHeading.numberOfLines = 0
        lblDescription.numberOfLines = 0
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateCellData(user : User?) {
        guard let user = user else {
            return
        }
        lblHeading.text = user.name
        lblDescription.text = user.description
        imgName.image = UIImage(named: user.img)
    }

}
