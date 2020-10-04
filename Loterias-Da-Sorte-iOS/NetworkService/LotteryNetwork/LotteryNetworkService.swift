//
//  LotteryNetworkService.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 01/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

protocol LotteryNetworkServiceable {
    func request(lottery: LotteryName, completion: @escaping ((Result<GameDetailModel, NetworkError>) -> Void))
}

final class LotteryNetworkService: LotteryNetworkServiceable {
    
    let networkService: NetworkServiceable
    
    init(networkService: NetworkServiceable) {
        self.networkService = networkService
    }
    
    func request(lottery: LotteryName, completion: @escaping ((Result<GameDetailModel, NetworkError>) -> Void)) {
        self.requestFor(lottery: lottery) { (result: Result<GameDetailModel, NetworkError>) in
            switch result {
            case .success(let dataModel):
                completion(.success(dataModel))
            case .failure(let errorModel):
                completion(.failure(errorModel))
            }
        }
    }
    
    func requestFor(lottery: LotteryName, completion: @escaping ((Result<GameDetailModel, NetworkError>) -> Void)) {
        let router = Router.lastGame(lottery: lottery.lotteryGame).stringURL()
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
    
    private func checkLottery(lottery: LotteryName, data: Data, completion: @escaping ((Result<GameDetailModel, NetworkError>) -> Void)) {
        switch lottery {
        case .megaSena:
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
        }
    }
    
    private func decoding<T: Codable>(type: T.Type, data: Data) -> T? {
        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return decoded
        } catch {
            return nil
        }
    }
}
