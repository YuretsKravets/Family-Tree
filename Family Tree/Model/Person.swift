//
//  Person.swift
//  My Family
//
//  Created by Yurii Kravets on 21/03/2020.
//  Copyright © 2020 Yurii Kravets. All rights reserved.
//

import Foundation

struct Person: Identifiable {
    let id: String
    
    //  Relations
    var fatherID: String?
    var motherID: String?
    var spouseID: [String]?
    
    //  Personal info
    var name: String
    var surname: String
    var born: Int
    var died: Int
    var avatar: String
    
    func getLifetime() -> String {
        var from = String(born)
        var to = String(died)
        
        if born == 0 {
            from = "..."
        }
        if died == 0 {
            to = "..."
        }
        return from + " - " + to
    }
}


