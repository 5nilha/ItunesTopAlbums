//
//  String+Extension.swift
//  ItunesTopAlbums
//
//  Created by Fabio Quintanilha on 1/18/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import Foundation

extension String {
    var stringIsoDateToDate: Date? {
        let isoDate = self

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from:isoDate)
        return date
    }
}
