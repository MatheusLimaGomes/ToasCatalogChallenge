//
//  DateFormatter+Extension.swift
//  Toast Catalog
//
//  Created by Matheus F S L Gomes on 08/06/23.
//

import Foundation

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter
    }()
}
