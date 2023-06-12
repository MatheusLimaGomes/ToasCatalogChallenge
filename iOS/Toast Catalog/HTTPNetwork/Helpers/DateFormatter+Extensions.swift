//
//  DateFormatter+Extensions.swift
//  Toast Catalog
//
//  Created by Matheus F S L Gomes on 12/06/23.
//

import Foundation

extension DateFormatter {
    // TODO: MAKE TESTS
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter
    }()
    // TODO: MAKE TESTS
   static func changeToSimpleDateHourAmPmFormatter(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        dateFormatter.locale = Locale(identifier: "en_US")
        
        if let dateInput = dateFormatter.date(from: dateString) {
            let newFormatter = DateFormatter()
            newFormatter.dateFormat = "dd-MM-yy hh:mm a"
            newFormatter.locale = Locale.current
            let dateStringFormatted = newFormatter.string(from: dateInput)
            return dateStringFormatted
        }
        return dateString
    }
}
