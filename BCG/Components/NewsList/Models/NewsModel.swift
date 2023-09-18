//
//  NewsModel.swift
//  BCG
//
//  Created by Nisha M, Mary (Cognizant) on 13/09/23.
//

import Foundation
struct ApiResponse : Codable {
    let section : String?
    let num_results : Int?
    let results : [NewsModel]?
}
struct NewsModel : Codable {
    let section:NewsCategory?
    let subsection: String?
    let title : String?
    let abstract : String?
    let byline : String?
    let url : String?
    let item_type : String?
    let updated_date : String?
    let created_date : String?
    let published_date : String?
    let multimedia :[Multimedia]?
}

struct Multimedia : Codable {
    let url: String?
    let format: String?
    let height : Int?
    let width :Int?
    let caption : String?
    let copyright : String?
}

enum NewsCategory:String,CaseIterable, Codable {
    case us = "us"
    case world = "world"
    case business = "business"
    case realestate = "realestate"
    case briefing = "briefing"
    case climate = "climate"
    case arts = "arts"
    case unknown = "General"
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        switch rawValue {
        case "us":
            self = .us
        case "world":
            self = .world
        case "business":
            self = .business
        case "realestate":
            self = .realestate
        case "briefing":
            self = .briefing
        case "climate":
            self = .climate
        case "arts":
            self = .arts
        default:
            self = .unknown
        }
    }
}


