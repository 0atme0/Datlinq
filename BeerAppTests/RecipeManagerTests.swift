//
//  RecipeManagerTests.swift
//  BeerAppTests
//
//  Created by atme on 11/07/2022.
//

import XCTest

class RecipeManagerTests: XCTestCase {

    var manager: RecipeManager!
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testInit() throws {
        let resultsNumber = 1
        let mainIngredient = "Test"
        manager = RecipeManager(resultsNumber: resultsNumber, mainIngredient: mainIngredient, networkManager: NetworkManager())
        XCTAssertEqual(manager.resultsNumber, resultsNumber)
        XCTAssertEqual(manager.mainIngredient, mainIngredient)
    }

}
