//
//  DateFormatter+Extension.swift
//  Toast Catalog
//
//  Created by Matheus F S L Gomes on 12/06/23.
//

import Foundation

extension DateFormatter {
   static func changeToSimpleDateHourAmPmFormatter(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        dateFormatter.locale = Locale(identifier: "en_US")
        
        if let dateInput = dateFormatter.date(from: dateString) {
            let newFormatter = DateFormatter()
            newFormatter.dateFormat = "d-MM-yy, hh:mm a"
            newFormatter.locale = Locale.current
            let dateStringFormatted = newFormatter.string(from: dateInput)
            return dateStringFormatted
        }
        return dateString
    }
}
