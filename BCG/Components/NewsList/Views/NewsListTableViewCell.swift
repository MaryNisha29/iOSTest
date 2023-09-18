//
//  NewsListTableViewCell.swift
//  BCG
//
//  Created by Nisha M, Mary (Cognizant) on 13/09/23.
//

import UIKit

class NewsListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    
    // Initialization code
    var newsData : NewsModel? {
        didSet {
            titleLbl.text = newsData?.title ?? ""
            if let imageUrlString = newsData?.multimedia?.last?.url {
                newsImageView.downloaded(from: imageUrlString)
            }

        }
    }
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
