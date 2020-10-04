//
//  Router.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

enum Router {
    case lastGame(lottery: LotteryGamesNoSpace)
    case gameWithNumber(number: Int, lottery: LotteryGamesNoSpace)
    
    private static let lotteryBaseURL = "https://\(PlistKey.lotteryAPIURL.getData())"
    
    var path: String {
        switch self {
        case .lastGame(let lotteryGame):
            return "/app/resultado?loteria=\(lotteryGame.rawValue)&token=\(PlistKey.lotteryAPIKEY.getData())"
        case .gameWithNumber(let number, let game):
            return "/app/resultado?loteria=\(game.rawValue)&token=\(PlistKey.lotteryAPIKEY.getData())&=concurso\(number)"
        }
    }
    
    func stringURL() -> String {
        switch self {
        case .lastGame(let game):
            var base = Router.lotteryBaseURL
            let parameters = Router.lastGame(lottery: game).path
            base.append(parameters)
            return base
        case .gameWithNumber(let number, let lottery):
            var base = Router.lotteryBaseURL
            let parameters = Router.gameWithNumber(number: number, lottery: lottery).path
            base.append(parameters)
            return base
        }
    }
    
    func url() -> URL? {
        switch self {
        case .lastGame(let game):
            var base = Router.lotteryBaseURL
            let parameters = Router.lastGame(lottery: game).path
            base.append(parameters)
            guard let url = URL(string: base) else { return nil }
            return url
        case .gameWithNumber(let number, let lottery):
            var base = Router.lotteryBaseURL
            let parameters = Router.gameWithNumber(number: number, lottery: lottery).path
            base.append(parameters)
            guard let url = URL(string: base) else { return nil }
            return url
        }
    }
}
