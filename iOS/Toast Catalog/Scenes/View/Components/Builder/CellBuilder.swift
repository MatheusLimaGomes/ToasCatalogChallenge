//
//  CellBuilder.swift
//  Toast Catalog
//
//  Created by Matheus F S L Gomes on 16/06/23.
//

import UIKit
protocol CellBuilder {
    func withIcon(_ image: UIImage?) -> CellBuilder
    func withTitle(_ title: String) -> CellBuilder
    func withSubtitle(_ subtitle: [String]) -> CellBuilder
    func build() -> UITableViewCell
}

final class CustomCellBuilder: CellBuilder {
    private var cell: CustomTableViewCell

    init() {
        cell = CustomTableViewCell()
    }

    func withIcon(_ image: UIImage?) -> CellBuilder {
        cell.iconImageView.image = image
        return self
    }

    func withTitle(_ title: String) -> CellBuilder {
        cell.titleLabel.text = title
        return self
    }

    func withSubtitle(_ subtitles: [String]) -> CellBuilder {
        cell.subtitlesStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        subtitles.enumerated().forEach {
            let subtitleLabel = UILabel()
            subtitleLabel.text = $0.element
            cell.subtitlesStackView.addArrangedSubview(subtitleLabel)
        }
        
        return self
    }

    func build() -> UITableViewCell {
        return cell
    }
}
