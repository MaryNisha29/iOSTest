//
//  NewsListTableViewController.swift
//  BCG
//
//  Created by Nisha M, Mary (Cognizant) on 13/09/23.
//

import UIKit

class NewsListTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let viewModel = NewsListVM()
    let listNibName = "NewsListTableViewCell"
    let detailVCId = "newsDetailsVC"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = viewModel.pageTitle
        self.tableView.register(UINib(nibName:listNibName , bundle: nil), forCellReuseIdentifier: viewModel.cellId)
        
        viewModel.fetchUserList { success in
            DispatchQueue.main.async {
                self.setTableView()
                
            }
            
        }
    }
    
    func setTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }
    

    func goToNewsDetails(news:NewsModel) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: detailVCId) as? NewsDetailViewController {
            let vm = NewsDetailsVM(news: news)
            vc.viewModel = vm
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }

}


extension NewsListTableViewController: UITableViewDataSource,UITableViewDelegate{
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return viewModel.sectionData.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //let sectionHeading = NewsCategory.allCases[section].rawValue.capitalized
        let sectionHeading = viewModel.sectionData[section].first?.section?.rawValue.uppercased()
        return sectionHeading
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.sectionData[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellId, for: indexPath) as! NewsListTableViewCell
        let newsItem = viewModel.sectionData[indexPath.section][indexPath.row]
        cell.newsData = newsItem
        cell.selectionStyle = UITableViewCell.SelectionStyle.none

        // Configure the cell...

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewModel.sectionData[indexPath.section][indexPath.row]
            self.goToNewsDetails(news: data)
    }
}
