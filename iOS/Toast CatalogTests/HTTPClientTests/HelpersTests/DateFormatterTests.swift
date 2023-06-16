//
//  DateFormatterTests.swift
//  Toast CatalogTests
//
//  Created by Matheus F S L Gomes on 16/06/23.
//
import XCTest
@testable import Toast_Catalog

class DateFormatterTests: XCTestCase {
    func testChangeToSimpleDateHourAmPmFormatter() {
        let dateString = "2023-06-15T12:34:56Z"
        let expectedFormattedDateString = "15-06-23, 12:34 PM"
        
        let formattedDateString = DateFormatter.changeToSimpleDateHourAmPmFormatter(dateString: dateString)
        
        XCTAssertEqual(formattedDateString, expectedFormattedDateString)
    }
    
}

