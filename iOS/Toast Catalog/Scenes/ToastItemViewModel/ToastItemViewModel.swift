//
//  ToastItemViewModel.swift
//  Toast Catalog
//
//  Created by Matheus F S L Gomes on 12/06/23.
//

import UIKit

struct ToastItemViewModel: ToastItemViewModelProtocol {
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
    var image: UIImage {
        ImageRepository.imageForItemIdentifier(itemItentifier: id) ?? UIImage()
    }
    var subtitles: [String] {
        [
            priceNormalized,
            lastSoldFormatted
        ]
    }
    init(name: String, price: String, id: Int, currency: String, lastSold: String) {
        self.name = name
        self.price = price
        self.id = id
        self.currency = currency
        self.lastSold = lastSold
    }
}
