//
//  ToastViewModelMapper.swift
//  Toast Catalog
//
//  Created by Matheus F S L Gomes on 16/06/23.
//

import Foundation

final class ToastViewModelMapper {
    func mapItemsToViewModels(_ items: [ToastCatalogItem]) -> [ToastItemViewModel] {
        items.map { item in
            ToastItemViewModel(name: item.name,
                               price: item.price,
                               id: item.id,
                               currency: item.currency,
                               lastSold: item.lastSold)
        }
    }
}
