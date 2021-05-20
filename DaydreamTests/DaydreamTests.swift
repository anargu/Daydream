//
//  DaydreamTests.swift
//  DaydreamTests
//
//  Created by Anargu on 19/05/21.
//

import XCTest
@testable import Daydream

class DaydreamTests: XCTestCase {

    let expectedCalls = 4
    var counterCalls = 0
    var expec : XCTestExpectation?


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        expec = expectation(description: "Timer expectation")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let context = ["user": "@twostraws"]

        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: context, repeats: true)
        RunLoop.current.add(timer, forMode: .common)

        
        guard expec != nil else {
            return
        }
        wait(for: [expec!], timeout: 7.0)
    }
    
    @objc func fireTimer(timer: Timer) {
        counterCalls += 1
        print("Timer fired!")
        if counterCalls >= 4 {
            timer.invalidate()
            expec?.fulfill()
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
