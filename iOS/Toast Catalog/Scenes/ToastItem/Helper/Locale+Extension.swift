//
//  Locale+Extension.swift
//  Toast Catalog
//
//  Created by Matheus F S L Gomes on 12/06/23.
//

import Foundation
extension Locale {
    static func locale(from currencyIdentifier: String) -> Locale? {
        let allLocales = Locale.availableIdentifiers.map({ Locale.init(identifier: $0) })
        return allLocales.filter({ $0.currencyCode == currencyIdentifier }).first
    }
}
