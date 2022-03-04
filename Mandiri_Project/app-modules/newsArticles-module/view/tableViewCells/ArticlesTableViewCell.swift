//
//  ArticlesTableViewCell.swift
//  Mandiri_Project
//
//  Created by Adhella Subalie on 04/03/22.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell {
    static var identifier = "ArticlesTableViewCell"
    static var nib: UINib {
        get {
            return UINib(nibName: identifier, bundle: nil)
        }
    }
    @IBOutlet var newsImage: UIImageView!
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
    
    func setContent(title: String, date: String, snippet: String, imageURL: String?) {
        newsTitle.text = title
        dateLabel.text = date
        newsSnippet.text = snippet
        if let url = URL(string: imageURL ?? "") {
            newsImage.imageFrom(url:url)
        }
    }
}
