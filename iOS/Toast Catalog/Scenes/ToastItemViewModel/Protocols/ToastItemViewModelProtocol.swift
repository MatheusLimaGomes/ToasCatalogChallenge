//
//  ToastItemViewModelProtocol.swift
//  Toast Catalog
//
//  Created by Matheus F S L Gomes on 16/06/23.
//

import UIKit
protocol ToastItemViewModelProtocol {
    var name: String { get }
    var priceNormalized: String { get }
    var lastSoldFormatted: String { get }
    var image: UIImage { get }
    var subtitles: [String] { get }
}
