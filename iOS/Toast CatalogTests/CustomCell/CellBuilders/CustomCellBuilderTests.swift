//
//  CustomCellBuilderTests.swift
//  Toast CatalogTests
//
//  Created by Matheus F S L Gomes on 16/06/23.
//

import XCTest
@testable import Toast_Catalog

class CustomCellBuilderTests: XCTestCase {
    var builder: CustomCellBuilder!

    override func setUp() {
        super.setUp()
        builder = CustomCellBuilder()
    }

    override func tearDown() {
        builder = nil
        super.tearDown()
    }

    func testBuild_ReturnsCustomTableViewCell() {
        let cell = builder.build()

        XCTAssertTrue(cell is CustomTableViewCell)
    }

    func testWithIcon_SetsIconImage() {
        let image = UIImage(named: "exampleImage")
        let cell = builder.withIcon(image).build() as! CustomTableViewCell

        XCTAssertEqual(cell.iconImageView.image, image)
    }

    func testWithTitle_SetsTitleText() {
        let title = "Example Title"
        let cell = builder.withTitle(title).build() as! CustomTableViewCell

        XCTAssertEqual(cell.titleLabel.text, title)
    }

    func testWithSubtitle_AddsSubtitleLabels() {
        let subtitles = ["Subtitle 1", "Subtitle 2", "Subtitle 3"]
        let cell = builder.withSubtitle(subtitles).build() as! CustomTableViewCell

        XCTAssertEqual(cell.subtitlesStackView.arrangedSubviews.count, subtitles.count)

        for (index, subtitle) in subtitles.enumerated() {
            let subtitleLabel = cell.subtitlesStackView.arrangedSubviews[index] as? UILabel
            XCTAssertEqual(subtitleLabel?.text, subtitle)
        }
    }
}
