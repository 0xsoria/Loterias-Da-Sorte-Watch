//
//  Loterias_Da_Sorte_iOSTests.swift
//  Loterias-Da-Sorte-iOSTests
//
//  Created by Gabriel Soria Souza on 01/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import XCTest
@testable import Loterias_Da_Sorte_iOS

final class Loterias_Da_Sorte_iOSTests: XCTestCase {

    var sut: LastGamesResultsInteractor!
    
    override func setUpWithError() throws {
        self.sut = LastGamesResultsInteractor(service:
                                                LotteryNetworkService(networkService: NetworkSpy()))
    }

    override func tearDownWithError() throws {
        //
    }
    
    func testRequestingMegaSenaDataAndDecoding() {
        let expectation = XCTestExpectation(description: "Expect")
        self.sut.requestFromService(lottery: .megaSena) { (result: Result<GameDetailModel, NetworkError>) in
            switch result {
            case .success(let game):
                expectation.fulfill()
                XCTAssertTrue(game.gameData.lotteryGame == .megasena)
            case .failure(let failure):
                print(failure)
            }
        }
        wait(for: [expectation], timeout: 2.0)
    }
}

