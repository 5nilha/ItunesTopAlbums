//
//  Date+Extension.swift
//  ItunesTopAlbums
//
//  Created by Fabio Quintanilha on 1/17/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import Foundation

extension Date {
    
    var formattedDateString : String {
        let formater = DateFormatter()
        formater.locale = Locale(identifier: "en_US")
        formater.dateFormat = "MMMM"

        let monthString = formater.string(from: self).capitalized
        let calendar = Calendar.current
        
        return "\(monthString) \(calendar.component(.day, from: self)), \(calendar.component(.year, from: self))"
        
    }
    
}
