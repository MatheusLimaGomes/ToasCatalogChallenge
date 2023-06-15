//
//  DateFormatter+ExtensionTests.swift
//  Toast CatalogTests
//
//  Created by Matheus F S L Gomes on 12/06/23.
//

import Foundation
@testable import Toast_Catalog
import XCTest
class DateFormatterExtensionTests: XCTestCase {
    func test_to_simple_date_hour_AM_PM_Formatted_when_iso8601_date() {
        let iSODate = "2020-07-13T18:51:53.928+0000"
        typealias sut = DateFormatter
        XCTAssertEqual("13-07-20 03:51 PM", sut.changeToSimpleDateHourAmPmFormatter(dateString: iSODate))
    }
}
