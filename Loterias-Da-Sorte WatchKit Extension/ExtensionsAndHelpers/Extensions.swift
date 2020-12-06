//
//  Extensions.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 18/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Lottery
import Foundation

func coloringItem(lottery: LotteryGames) -> LotteryColor {
    switch lottery {
    case .megasena:
        return .megasena
    case .quina:
        return .quina
    case .lotofacil:
        return .lotofacil
    case .lotomania:
        return .lotoMania
    case .diadesorte:
        return .diaDeSorte
    case .duplasena:
        return .duplaSena
    case .federal:
        return .federal
    case .timemania:
        return .timeMania
    }
}

func diadesorteNumberToMonth(monthInNumber: String?) -> String {
    switch monthInNumber {
    case "1":
        return "Janeiro"
    case "2":
        return "Fevereiro"
    case "3":
        return "Março"
    case "4":
        return "Abril"
    case "5":
        return "Maio"
    case "6":
        return "Junho"
    case "7":
        return "Julho"
    case "8":
        return "Agosto"
    case "9":
        return "Setembro"
    case "10":
        return "Outubro"
    case "11":
        return "Novembro"
    case "12":
        return "Dezembro"
    default:
        return ""
    }
}
