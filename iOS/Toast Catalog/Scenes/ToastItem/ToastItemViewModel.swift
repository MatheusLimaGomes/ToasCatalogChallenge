//
//  ToastItemViewModel.swift
//  Toast Catalog
//
//  Created by Matheus F S L Gomes on 12/06/23.
//

import Foundation

struct ToastItemViewModel {
    private let price: String
    private let currency: String
    private let lastSold: String
    let name: String
    let id: Int
    var priceNormalized: String {
        price.withCurrencySymbol(symbolName: currency)
    }
    var lastSoldFormatted: String {
        DateFormatter.changeToSimpleDateHourAmPmFormatter(dateString: lastSold)
    }
    init(name: String, price: String, id: Int, currency: String, lastSold: String) {
        self.name = name
        self.price = price
        self.id = id
        self.currency = currency
        self.lastSold = lastSold
    }
}
