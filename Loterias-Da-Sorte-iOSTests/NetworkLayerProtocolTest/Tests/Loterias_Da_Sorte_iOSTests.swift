//
//  Loterias_Da_Sorte_iOSTests.swift
//  Loterias-Da-Sorte-iOSTests
//
//  Created by Gabriel Soria Souza on 01/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Lottery
import Network
import XCTest
@testable import Loterias_Da_Sorte

final class Loterias_Da_Sorte_iOSTests: XCTestCase {

    var sut: GamesResults!
    
    override func setUpWithError() throws {
        //
    }

    override func tearDownWithError() throws {
        //
    }
    
    func testMock() {
        let mock = LotteryMock()
        let data = mock.mockData(fileName: .megasena)
        XCTAssertTrue(data.lotteryGame == .megasena)
    }
    
    func testRequestingMegaSenaDataAndDecoding() {
        self.sut = GamesResults(service:
                                                LotteryNetworkService(networkService: NetworkSpy(fileName: "SenaLast")))
        let expectation = XCTestExpectation(description: "Expect")
        self.sut.requestFromService(lottery: .megasena) { (result: Result<GameDetailModel, NetworkError>) in
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
    
    func testRequestingQuinaDataAndDecoding() {
        self.sut = GamesResults(service:
                                                LotteryNetworkService(networkService: NetworkSpy(fileName: "QuinaLast")))
        let expectation = XCTestExpectation(description: "Expect Quina Last")
        self.sut.requestFromService(lottery: .quina) { (result: Result<GameDetailModel, NetworkError>) in
            switch result {
            case .success(let game):
                expectation.fulfill()
                XCTAssertTrue(game.gameData.lotteryGame == .quina)
            case .failure(let failure):
                print(failure)
            }
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testRequestingLotoFacilDataAndDecoding() {
        self.sut = GamesResults(service:
                                                LotteryNetworkService(networkService: NetworkSpy(fileName: "LotoFacilLast")))
        let expectation = XCTestExpectation(description: "Expect Lotofacil Last")
        self.sut.requestFromService(lottery: .lotofacil) { (result: Result<GameDetailModel, NetworkError>) in
            switch result {
            case .success(let game):
                expectation.fulfill()
                XCTAssertTrue(game.gameData.lotteryGame == .lotofacil)
            case .failure(let failure):
                print(failure)
            }
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testRequestingLotomaniaDataAndDecoding() {
        self.sut = GamesResults(service:
                                                LotteryNetworkService(networkService: NetworkSpy(fileName: "LotoManiaLast")))
        let expectation = XCTestExpectation(description: "Expect LotoMania Last")
        self.sut.requestFromService(lottery: .lotomania) { (result: Result<GameDetailModel, NetworkError>) in
            switch result {
            case .success(let game):
                expectation.fulfill()
                XCTAssertTrue(game.gameData.lotteryGame == .lotomania)
            case .failure(let failure):
                print(failure)
            }
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testRequestingDuplaSenaDataAndDecoding() {
        self.sut = GamesResults(service:
                                                LotteryNetworkService(networkService: NetworkSpy(fileName: "DuplaSenaLast")))
        let expectation = XCTestExpectation(description: "Expect Dupla Last")
        self.sut.requestFromService(lottery: .duplasena) { (result: Result<GameDetailModel, NetworkError>) in
            switch result {
            case .success(let game):
                expectation.fulfill()
                XCTAssertTrue(game.gameData.lotteryGame == .duplasena)
            case .failure(let failure):
                print(failure)
            }
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testRequestingTimeDataAndDecoding() {
        self.sut = GamesResults(service:
                                                LotteryNetworkService(networkService: NetworkSpy(fileName: "TimeLast")))
        let expectation = XCTestExpectation(description: "Expect Time Last")
        self.sut.requestFromService(lottery: .timemania) { (result: Result<GameDetailModel, NetworkError>) in
            switch result {
            case .success(let game):
                expectation.fulfill()
                XCTAssertTrue(game.gameData.lotteryGame == .timemania)
            case .failure(let failure):
                print(failure)
            }
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testRequestingDiaDataAndDecoding() {
        self.sut = GamesResults(service:
                                                LotteryNetworkService(networkService: NetworkSpy(fileName: "DiaLast")))
        let expectation = XCTestExpectation(description: "Expect Dia Last")
        self.sut.requestFromService(lottery: .diadesorte) { (result: Result<GameDetailModel, NetworkError>) in
            switch result {
            case .success(let game):
                expectation.fulfill()
                XCTAssertTrue(game.gameData.lotteryGame == .diadesorte)
            case .failure(let failure):
                print(failure)
            }
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testRequestingFederalDataAndDecoding() {
        self.sut = GamesResults(service:
                                                LotteryNetworkService(networkService: NetworkSpy(fileName: "FederalLast")))
        let expectation = XCTestExpectation(description: "Expect Federal Last")
        self.sut.requestFromService(lottery: .federal) { (result: Result<GameDetailModel, NetworkError>) in
            switch result {
            case .success(let game):
                expectation.fulfill()
                XCTAssertTrue(game.gameData.lotteryGame == .federal)
            case .failure(let failure):
                print(failure)
            }
        }
        wait(for: [expectation], timeout: 3.0)
    }
}
