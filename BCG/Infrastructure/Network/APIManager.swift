//
//  APIManager.swift
//  BCG
//
//  Created by Nisha M, Mary (Cognizant) on 13/09/23.
//

import Foundation
import UIKit

class APIManager {
    static let shared = APIManager()
    
    private init() {}
    
    
    func getAPI(completion: @escaping (Data?, Error?) -> Void) {
        let urlString = APIConstants.baseURL + APIConstants.apiKey
        print(urlString)
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                if let data = data {
                    completion(data, nil)
                }
                completion(nil, error)
            }.resume()
        }
    }
    
}


struct APIConstants {
    static let baseURL = "https://api.nytimes.com/svc/topstories/v2/world.json?api-key="
    static let apiKey = "RiTezICSAaZ5XpGZmatS198JEYwMiaBT"
    
}
