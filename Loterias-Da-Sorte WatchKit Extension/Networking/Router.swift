//
//  Router.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

enum Router {
    case newAnalytics(date: String, view: String, lottery: String, onSession: Int)
    case lastGame(lottery: LotteryGamesNoSpace)
    case gameWithNumber(number: Int, lottery: LotteryGamesNoSpace)
    case statistics(lottery: LotteryGamesNoSpace)
    case similarGames(lottery: LotteryGamesNoSpace, numbers: String)
    
    private static let newAnalyticsBaseURL = PlistKey.analyticsURL.rawValue
    private static let lotteryBaseURL = PlistKey.lotteryAPIURL.rawValue
    private static let similarGamesBaseURL = PlistKey.similarGamesURL.rawValue
    private static let statisticsBaseURL = PlistKey.statisticsAPIURL.rawValue
    
    var path: String {
        switch self {
        case .newAnalytics:
            return "/"
        case .lastGame(let lotteryGame):
            return "loteria=\(lotteryGame.rawValue)&token=\(PlistKey.lotteryAPIKEY.rawValue)"
        case .gameWithNumber(let number, let game):
            return "loteria=\(game.rawValue)&token=\(PlistKey.lotteryAPIKEY.rawValue)&=concurso\(number)"
        case .similarGames(let game, let numbers):
            return "/\(game.rawValue)/search?term=\(numbers)"
        case .statistics(let game):
            return "/estatisticas/\(game)"
        }
    }
    
    func url() -> URL? {
        switch self {
        case .newAnalytics(let date, let view, let lottery, let onSession):
            var urlBase = Router.newAnalyticsBaseURL
            let base = Router.newAnalytics(date: date, view: view, lottery: lottery, onSession: onSession).path
            urlBase.append(base)
            guard let url = URL(string: base) else { return nil }
            return url
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
        case .similarGames(let lottery, let numbers):
            var base = Router.similarGamesBaseURL
            let parameters = Router.similarGames(lottery: lottery, numbers: numbers).path
            base.append(parameters)
            guard let url = URL(string: base) else { return nil }
            return url
        case .statistics(let lottery):
            var base = Router.statisticsBaseURL
            let urlBase = Router.statistics(lottery: lottery).path
            base.append(urlBase)
            guard let url = URL(string: base) else { return nil }
            return url
        }
    }
}
