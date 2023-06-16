//
//  CustomTableViewCell.swift
//  Toast CatalogTests
//
//  Created by Matheus F S L Gomes on 16/06/23.
//

import XCTest
@testable import Toast_Catalog

class CustomTableViewCellTests: XCTestCase {
    
    var cell: CustomTableViewCell!
    
    override func setUp() {
        super.setUp()
        cell = CustomTableViewCell(style: .default, reuseIdentifier: "CustomTableViewCell")
    }
    
    override func tearDown() {
        cell = nil
        super.tearDown()
    }
    
    func testCellHasIconImageView() {
        XCTAssertTrue(cell.iconImageView.isDescendant(of: cell.contentView))
    }
    
    func testCellHasTitleLabel() {
        XCTAssertTrue(cell.titleLabel.isDescendant(of: cell.contentView))
    }
    
    func testCellHasSubtitlesStackView() {
        XCTAssertTrue(cell.subtitlesStackView.isDescendant(of: cell.contentView))
    }
    
    func testIconImageViewConstraints() {
        let leadingConstraint = cell.iconImageView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 8)
        let topConstraint = cell.iconImageView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8)
        let bottomConstraint = cell.iconImageView.bottomAnchor.constraint(lessThanOrEqualTo: cell.contentView.bottomAnchor, constant: -8)
        let widthConstraint = cell.iconImageView.widthAnchor.constraint(equalToConstant: 30)
        
        XCTAssertNotNil(leadingConstraint)
        XCTAssertNotNil(topConstraint)
        XCTAssertNotNil(bottomConstraint)
        XCTAssertNotNil(widthConstraint)
    }

    
    func testTitleLabelConstraints() {
        let leadingConstraint = cell.titleLabel.leadingAnchor.constraint(equalTo: cell.iconImageView.trailingAnchor, constant: 8)
        let topConstraint = cell.titleLabel.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 2)
        let trailingConstraint = cell.titleLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -8)
        
        XCTAssertNotNil(leadingConstraint)
        XCTAssertNotNil(topConstraint)
        XCTAssertNotNil(trailingConstraint)
    }

    
    func testSubtitlesStackViewConstraints() {
        let leadingConstraint = cell.contentView.constraintsAffectingLayout(for: .horizontal).first { $0.firstItem === cell.subtitlesStackView && $0.firstAttribute == .leading }
        let trailingConstraint = cell.contentView.constraintsAffectingLayout(for: .horizontal).first { $0.firstItem === cell.subtitlesStackView && $0.firstAttribute == .trailing }
        let topConstraint = cell.contentView.constraintsAffectingLayout(for: .vertical).first { $0.firstItem === cell.subtitlesStackView && $0.firstAttribute == .top }
        let bottomConstraint = cell.contentView.constraintsAffectingLayout(for: .vertical).first { $0.firstItem === cell.subtitlesStackView && $0.firstAttribute == .bottom }
        
        XCTAssertNotNil(leadingConstraint)
        XCTAssertNotNil(trailingConstraint)
        XCTAssertNotNil(topConstraint)
        XCTAssertNotNil(bottomConstraint)
    }
}
