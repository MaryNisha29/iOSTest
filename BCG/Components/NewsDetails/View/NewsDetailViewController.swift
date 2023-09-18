//
//  NewsDetailViewController.swift
//  BCG
//
//  Created by Nisha M, Mary (Cognizant) on 14/09/23.
//

import UIKit

class NewsDetailViewController: UIViewController {

    var viewModel:NewsDetailsVM?
    @IBOutlet weak var tableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        // Do any additional setup after loading the view.
    }
    
    func setTableView(){
        self.tableView.estimatedRowHeight = 200
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }

}

extension NewsDetailViewController :UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConstantStrings.headerCell) as! HeaderCell
        if let data = viewModel?.news {
            cell.setUpCell(news: data)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ConstantStrings.imageCell, for: indexPath) as! ImageCell

            // Configure the cell...
            if let data = viewModel?.news {
                cell.setUpCell(news: data)
            }
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ConstantStrings.detailsCell, for: indexPath) as! DetailsCell
            if let data = viewModel?.news {
                cell.setUpCell(news: data)
            }

            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ConstantStrings.autherCell, for: indexPath) as! autherCell

            // Configure the cell...
            if let data = viewModel?.news {
                cell.setUpCell(news: data)
            }

            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableView.automaticDimension
        }else if indexPath.row == 1 {
            return UITableView.automaticDimension
        }
        else{
            return 60
        }
    }
    
}
