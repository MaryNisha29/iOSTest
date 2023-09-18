//
//  NewsListVM.swift
//  BCG
//
//  Created by Nisha M, Mary (Cognizant) on 14/09/23.
//

import Foundation
import UIKit

class NewsListVM {
    let cellId = "newsListTableViewCell"
    var newsList: ApiResponse?
    var errorMessage = ""
    var sectionData:[[NewsModel]] = []
    
    let pageTitle = "Latest News"
    
    func fetchUserList(completion: @escaping (Bool) -> Void) {
        APIManager.shared.getAPI() { [weak self] response, error in
            if let error = error {
                print("error",error)
                //completion(error)
                DispatchQueue.main.async {
                    self?.errorMessage = "API Failed"
                }
                completion(false)
            }
            
            if let data = response {
                do {
                    self?.newsList = try JSONDecoder().decode(ApiResponse.self, from: data)
                    self?.getSectionWiseData()
                    completion(true)
                    
                } catch {
                    //completion(nil, error)
                    print(error)
                    DispatchQueue.main.async {
                        self?.errorMessage = "Data Parsing Error"
                    }
                    completion(false)
                }
            }
        }
    }
    

    
    func getSectionWiseData(){
        for type in NewsCategory.allCases {
            let news = newsList?.results?.filter({ item in
                item.section == type
            })
            sectionData.append(news ?? [])
        }
    }
    
    
    
}
