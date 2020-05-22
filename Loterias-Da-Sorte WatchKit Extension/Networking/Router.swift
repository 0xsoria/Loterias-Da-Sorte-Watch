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
    
    private static let lotteryBaseURL = PlistKey.lotteryAPIURL.getData()
    
    var path: String {
        switch self {
        case .lastGame(let lotteryGame):
            return "loteria=\(lotteryGame.rawValue)&token=\(PlistKey.lotteryAPIKEY.getData())"
        case .gameWithNumber(let number, let game):
            return "loteria=\(game.rawValue)&token=\(PlistKey.lotteryAPIKEY.getData())&=concurso\(number)"
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
