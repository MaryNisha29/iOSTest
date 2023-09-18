//
//  HeaderCell.swift
//  BCG
//
//  Created by Nisha M, Mary (Cognizant) on 14/09/23.
//

import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet weak var headingLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setUpCell(news:NewsModel){
        headingLabel.text = news.title
    }
}
