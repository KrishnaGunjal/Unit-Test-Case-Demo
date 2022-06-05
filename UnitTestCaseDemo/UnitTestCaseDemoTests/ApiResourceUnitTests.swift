//
//  ApiResourceUnitTests.swift
//  UnitTestCaseDemoTests
//∫
//  Created by Krishna Gunjal on 04/06/22.
//

import XCTest
@testable import UnitTestCaseDemo

class ApiResourceUnitTests: XCTestCase {

    func test_ApiResource_With_ValidRequest_returns_loginResponse() {
        let expectation = self.expectation(description: "ValidRequest_Returns_LoginResponse")
        
        APIService.shared.getData { response in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

}
