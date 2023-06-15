//
//  ToastCatalogPresenter.swift
//  Toast Catalog
//
//  Created by Matheus F S L Gomes on 12/06/23.
//

import Foundation


final class ToastCatalogPresenter: ToastCatalogPresenterProtocol {
    var toastItemViewModel: [ToastItemViewModel]?
    private let viewModelMapper: ToastViewModelMapper
    let service: ToastCatalogServiceable
    init(service: ToastCatalogServiceable,
         viewModelMapper: ToastViewModelMapper) {
        self.service = service
        self.viewModelMapper = viewModelMapper
    }
    func getItems(completion: @escaping(Result<Void, RequestError>) -> Void) {
        Task(priority: .background) {
            let result = await service.getItems()
            switch result {
            case .success(let items):
                toastItemViewModel = viewModelMapper.mapItemsToViewModels(items)
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}


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
