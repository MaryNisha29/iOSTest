//
//  ImageCell.swift
//  BCG
//
//  Created by Nisha M, Mary (Cognizant) on 14/09/23.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(news:NewsModel){
        if let url = news.multimedia?.first?.url {
            newsImage.downloaded(from: url)
        }
        if let dateString = news.published_date {
            dateLabel.text = Utility.formattedDate(dateString: dateString) + "\n" + (news.subsection ?? "").capitalized
        }
    }

}
