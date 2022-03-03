//
//  CategoryTableViewCell.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 03/03/22.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    static var identifier = "CategoryTableViewCell"
    static var nib: UINib {
        get {
            return UINib(nibName: identifier, bundle: nil)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
