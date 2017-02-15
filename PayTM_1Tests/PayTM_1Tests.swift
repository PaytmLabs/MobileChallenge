//
//  PayTM_1Tests.swift
//  PayTM_1Tests
//
//  Created by Konstantin Klyatskin on 2017-02-09.
//  Copyright © 2017 Konstantin Klyatskin. All rights reserved.
//

import XCTest

@testable import PayTM_1

class PayTM_1Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testDateExtension() {
        let date1 = Date()
        let date2 = Date.from(description: date1.description)
        let timeDiff = date1.timeIntervalSince(date2)
        XCTAssert(timeDiff < 1, "Date description decoding fails.")
    }
    
    func testDataProvider() {
        // dependancy ejection
        let dataProvider = DataProvider()
        dataProvider.networkStack = MockNetworkStack()
        dataProvider.coreDataStack = nil
        dataProvider.updateData()
        let totalCurrencies = dataProvider.numberOfCurrencies()
        XCTAssert( totalCurrencies == 32, "Data provider fails.")
    }

}
