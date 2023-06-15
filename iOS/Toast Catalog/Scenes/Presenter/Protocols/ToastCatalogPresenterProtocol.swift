//
//  ToastCatalogPresenterProtocol.swift
//  Toast Catalog
//
//  Created by Matheus F S L Gomes on 12/06/23.
//

import Foundation
protocol ToastCatalogPresenterProtocol: AnyObject {
    var toastItemViewModel: [ToastItemViewModel]? { get }
    var service: ToastCatalogServiceable { get }
    func getItems(completion: @escaping(Result<Void, RequestError>) -> Void)
}
