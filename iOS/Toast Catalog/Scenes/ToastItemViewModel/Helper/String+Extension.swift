//
//  String+Extension.swift
//  Toast Catalog
//
//  Created by Matheus F S L Gomes on 12/06/23.
//

import Foundation

extension String {
    func withCurrencySymbol(symbolName: String) -> String {
        if let currencySymbol = Locale.locale(from: symbolName)?.currencySymbol {
            return "\(self) \(currencySymbol)"
        }
        else {
            return "\(self) $"
        }
    }
}
