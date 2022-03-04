//
//  NoThumbnailArticlesTableViewCell.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 04/03/22.
//

import UIKit

class NoThumbnailArticlesTableViewCell: UITableViewCell {

    static var identifier = "NoThumbnailArticlesTableViewCell"
    static var nib: UINib {
        get {
            return UINib(nibName: identifier, bundle: nil)
        }
    }
    @IBOutlet var newsTitle: UILabel!
    @IBOutlet var newsSnippet: UILabel!
    @IBOutlet var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setContent(title: String, date: String, snippet: String) {
        newsTitle.text = title
        dateLabel.text = date
        newsSnippet.text = snippet
    }
    
}
