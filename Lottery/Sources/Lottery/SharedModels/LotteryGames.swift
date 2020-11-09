//
//  LotteryGames.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

public enum LotteryGames: String {
    case megasena = "Mega Sena"
    case quina = "Quina"
    case lotofacil = "Lotofácil"
    case lotomania = "Lotomania"
    case duplasena = "Dupla Sena"
    case timemania = "Timemania"
    case diadesorte = "Dia de Sorte"
    case federal = "Federal"
    
    public func colorFromGame() -> LotteryColor {
        switch self {
        case .megasena:
            return .megasena
        case .quina:
            return .quina
        case .lotofacil:
            return .lotofacil
        case .lotomania:
            return .lotoMania
        case .duplasena:
            return .duplaSena
        case .timemania:
            return .timeMania
        case .diadesorte:
            return .diaDeSorte
        case .federal:
            return .federal
        }
    }
    
    public func convertToLotteryNoSpace() -> LotteryGamesNoSpace {
        switch self {
        case .megasena:
            return .megasena
        case .quina:
            return .quina
        case .lotofacil:
            return .lotofacil
        case .lotomania:
            return .lotomania
        case .duplasena:
            return .duplasena
        case .timemania:
            return .timemania
        case .diadesorte:
            return .diadesorte
        case .federal:
            return .federal
        }
    }
}

public enum LotteryGamesNoSpace: String {
    case megasena = "megasena"
    case quina = "quina"
    case lotofacil = "lotofacil"
    case lotomania = "lotomania"
    case duplasena = "duplasena"
    case timemania = "timemania"
    case diadesorte = "diadesorte"
    case federal = "federal"
    
    public func colorFromGame() -> LotteryColor {
        switch self {
        case .megasena:
            return .megasena
        case .quina:
            return .quina
        case .lotofacil:
            return .lotofacil
        case .lotomania:
            return .lotoMania
        case .duplasena:
            return .duplaSena
        case .timemania:
            return .timeMania
        case .diadesorte:
            return .diaDeSorte
        case .federal:
            return .federal
        }
    }
    
    public func convertToLotteryGame() -> LotteryGames {
        switch self {
        case .megasena:
            return .megasena
        case .quina:
            return .quina
        case .lotofacil:
            return .lotofacil
        case .lotomania:
            return .lotomania
        case .duplasena:
            return .duplasena
        case .timemania:
            return .timemania
        case .diadesorte:
            return .diadesorte
        case .federal:
            return .federal
        }
    }
}
