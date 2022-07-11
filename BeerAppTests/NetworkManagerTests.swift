//
//  NetworkManagerTests.swift
//  BeerAppTests
//
//  Created by atme on 11/07/2022.
//

import XCTest

class NetworkManagerTests: XCTestCase {

    var networkManager: NetworkManager!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testErrorWrongURL() throws {
        networkManager = NetworkManager()
        let urlRequest = URLRequest(url: URL(string: "www.123.com")!)
        let expectation = XCTestExpectation(description: "response")
        networkManager.resumeDataTask(withRequest: urlRequest) { result in
            switch result {
            case .success(let data):
                XCTFail("The response should've been successful!")
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, "unsupported URL")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    func testCorrectURL() throws {
        networkManager = NetworkManager()
        let urlRequest = URLRequest(url: URL(string: Constant.urlString)!)
        let expectation = XCTestExpectation(description: "response")
        networkManager.resumeDataTask(withRequest: urlRequest) { result in
            switch result {
            case .success(let data):
                if data.isEmpty {
                    XCTFail("The data should've been empty!")
                } 
            case .failure(let error):
                XCTFail("The response should've been failure!")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

}
