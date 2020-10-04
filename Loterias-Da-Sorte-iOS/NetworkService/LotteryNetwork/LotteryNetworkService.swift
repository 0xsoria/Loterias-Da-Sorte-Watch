//
//  LotteryNetworkService.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 01/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

protocol LotteryNetworkServiceable {
    func request(lottery: LotteryGamesNoSpace, completion: @escaping ((Result<GameDetailModel, NetworkError>) -> Void))
}

final class LotteryNetworkService: LotteryNetworkServiceable {
    
    let networkService: NetworkServiceable
    
    init(networkService: NetworkServiceable) {
        self.networkService = networkService
    }
    
    func request(lottery: LotteryGamesNoSpace, completion: @escaping ((Result<GameDetailModel, NetworkError>) -> Void)) {
        self.requestFor(lottery: lottery) { (result: Result<GameDetailModel, NetworkError>) in
            switch result {
            case .success(let dataModel):
                completion(.success(dataModel))
            case .failure(let errorModel):
                completion(.failure(errorModel))
            }
        }
    }
    
    func requestFor(lottery: LotteryGamesNoSpace, completion: @escaping ((Result<GameDetailModel, NetworkError>) -> Void)) {
        let router = Router.lastGame(lottery: lottery).stringURL()
        self.networkService.request(url: router) { (result: Result<Data, NetworkError>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.checkLottery(lottery: lottery, data: data, completion: completion)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    private func checkLottery(lottery: LotteryGamesNoSpace, data: Data, completion: @escaping ((Result<GameDetailModel, NetworkError>) -> Void)) {
        switch lottery {
        case .megasena:
            if let decoded: SenaConcourseData = self.decoding(type: SenaConcourseData.self, data: data) {
                completion(.success(GameDetailModel(gameData:
                                                        decoded.convertToLotteryWorker(),
                                                    headers: GameDetailData().megaQuinaFacilMania)))
                return
            }
            completion(.failure(.invalidJSON))
        case.quina:
            if let decoded: QuinaConcourseData = self.decoding(type: QuinaConcourseData.self, data: data) {
                completion(.success(GameDetailModel(gameData: decoded.quinaWorkerDataToLotteryWorker(),
                                                    headers: GameDetailData().megaQuinaFacilMania)))
            }
        case .lotofacil:
            if let decoded: LotoFacilConcourseData = self.decoding(type: LotoFacilConcourseData.self, data: data) {
                completion(.success(GameDetailModel(
                                        gameData: decoded
                                            .lotoFacilWorkerDataToLotteryWorker(),
                                        headers: GameDetailData()
                                            .megaQuinaFacilMania)))
                return
            }
            completion(.failure(.invalidJSON))
        case .lotomania:
            if let decoded: LotoManiaConcourseData = self.decoding(type: LotoManiaConcourseData.self, data: data) {
                completion(.success(GameDetailModel(gameData: decoded.lotomaniaWorkerDataToLotteryWorker(),
                                                    headers: GameDetailData().megaQuinaFacilMania)))
                return
            }
            completion(.failure(.invalidJSON))
        case .duplasena:
            if let decoded: DuplaSenaConcourseData = self.decoding(type: DuplaSenaConcourseData.self, data: data) {
                completion(.success(GameDetailModel(gameData: decoded.duplasenaWorkerDataToLotteryWorker(),
                                                    headers: GameDetailData().duplaSena)))
                return
            }
            completion(.failure(.invalidJSON))
        case .timemania:
            if let decoded: TimeManiaConcourseData = self.decoding(type: TimeManiaConcourseData.self, data: data) {
                completion(.success(GameDetailModel(gameData: decoded.timemaniaWorkerDataToLotteryWorker(),
                                                    headers: GameDetailData().time)))
                return
            }
            completion(.failure(.invalidJSON))
        case .diadesorte:
            if let decoded: DiaDeSorteConcourseData = self.decoding(type: DiaDeSorteConcourseData.self, data: data) {
                completion(.success(GameDetailModel(gameData: decoded.diadesorteWorkerDataToLotteryWorker(),
                                                    headers: GameDetailData().dia)))
                return
            }
            completion(.failure(.invalidJSON))
        case .federal:
            if let decoded: FederalConcourseData = self.decoding(type: FederalConcourseData.self, data: data) {
                completion(.success(GameDetailModel(gameData: decoded.federalWorkerDataToLotteryWorker(),
                                                    headers: GameDetailData().federal)))
                return
            }
            completion(.failure(.invalidJSON))
        }
    }
    
    private func decoding<T: Codable>(type: T.Type, data: Data) -> T? {
        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return decoded
        } catch let error {
            print(error)
            return nil
        }
    }
}
