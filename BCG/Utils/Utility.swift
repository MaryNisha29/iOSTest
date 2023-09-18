//  BCG
//
//  Created by Nisha M, Mary (Cognizant) on 13/09/23.
//

import Foundation
import UIKit

class Utility {
    
    static func formattedDate(dateString: String) -> String  {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "MMM d, h:mm a"
            let formattedDateString = formatter.string(from: date)
            return formattedDateString
        }
        return dateString
    }
}

