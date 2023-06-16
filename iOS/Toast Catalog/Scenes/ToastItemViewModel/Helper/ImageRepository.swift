//
//  ImageRepository.swift
//  Toast Catalog
//
//  Created by Matheus F S L Gomes on 14/06/23.
//
import UIKit

enum ImageRepository {
    static func imageForItemIdentifier<T: BinaryInteger>(itemItentifier: T) -> UIImage? {
        let systemImageName: String
        if itemItentifier >= 0 && itemItentifier <= 50 {
            systemImageName = "\(itemItentifier).circle.fill"
        } else {
            systemImageName = "placeholdertext.fill"
        }
        return UIImage(systemName: systemImageName)
    }
}
