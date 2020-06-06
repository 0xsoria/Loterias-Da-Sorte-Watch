//
//  NextGameDetailRequester.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

final class GameDetailRequester: ObservableObject {
    
    private let didChange = PassthroughSubject<GameDetailModel, Never>()
    private let requester =  Requester()
    var lottery: LotteryGames?
    @Published var returnData: GameDetailModel?
    
    func request(lottery: LotteryGames) {
        self.requester.myRequest(router: Router.lastGame(lottery: lottery.convertToLotteryNoSpace())) { [weak self] (result: Result<Data, LotteryNetworkError>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.checkLottery(lottery: lottery.convertToLotteryNoSpace(), data: data)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func checkLottery(lottery: LotteryGamesNoSpace, data: Data) {
        switch lottery {
        case .megasena:
            self.resultDecoded(data: data) { [weak self] (result: SenaConcourseData) in
                self?.returnData = GameDetailModel(gameData: result.convertToLotteryWorker(), headers: GameDetailData().megaQuinaFacilMania)
            }
        case .quina:
            self.resultDecoded(data: data) { [weak self] (result: QuinaConcourseData) in
                 self?.returnData = GameDetailModel(gameData: result.quinaWorkerDataToLotteryWorker(), headers: GameDetailData().megaQuinaFacilMania)
            }
        case .lotomania:
            self.resultDecoded(data: data) { [weak self] (result: LotoManiaConcourseData) in
                self?.returnData = GameDetailModel(gameData: result.lotomaniaWorkerDataToLotteryWorker(), headers: GameDetailData().megaQuinaFacilMania)
            }
        case .lotofacil:
            self.resultDecoded(data: data) { [weak self] (result: LotoFacilConcourseData) in
                self?.returnData = GameDetailModel(gameData: result.lotoFacilWorkerDataToLotteryWorker(), headers: GameDetailData().megaQuinaFacilMania)
            }
        case .duplasena:
            self.resultDecoded(data: data) { [weak self] (result: DuplaSenaConcourseData) in
                self?.returnData = GameDetailModel(gameData: result.duplasenaWorkerDataToLotteryWorker(), headers: GameDetailData().duplaSena)
            }
        case .timemania:
            self.resultDecoded(data: data) { [weak self] (result: TimeManiaConcourseData) in
                
                self?.returnData = GameDetailModel(gameData: result.timemaniaWorkerDataToLotteryWorker(), headers: GameDetailData().time)
            }
        case .federal:
            self.resultDecoded(data: data) { [weak self] (result: FederalConcourseData) in
                self?.returnData = GameDetailModel(gameData: result.federalWorkerDataToLotteryWorker(), headers: GameDetailData().federal)
            }
        case .diadesorte:
            self.resultDecoded(data: data) { [weak self] (result: DiaDeSorteConcourseData) in
                
                self?.returnData = GameDetailModel(gameData: result.diadesorteWorkerDataToLotteryWorker(), headers: GameDetailData().dia)
                
            }
        }
    }
    
    private func resultDecoded<T: Codable>(data: Data, completion: @escaping (T) -> Void) {
        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            completion(decoded)
        } catch {
            print(error)
        }
    }
}
