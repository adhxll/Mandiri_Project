//
//  SourcesTableViewCell.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 03/03/22.
//

import UIKit

class SourcesTableViewCell: UITableViewCell {
    static var identifier = "SourcesTableViewCell"
    static var nib: UINib {
        get {
            return UINib(nibName: identifier, bundle: nil)
        }
    }
    
    @IBOutlet var newsSourceName: UILabel!
    @IBOutlet var newsSourceDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setContent(title: String, desc: String) {
        newsSourceName.text = title
        newsSourceDescription.text = desc
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
