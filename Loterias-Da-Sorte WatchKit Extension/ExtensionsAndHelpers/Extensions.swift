//
//  Extensions.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 18/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

public func arrayDataToStringWithDash(content: [Int]) -> String {
    let str = content.reduce("") { $0 + "-\($1)" }
    guard !str.isEmpty else {
        return str
    }
    return gettingSpacesInTheBeginingOfStr(str: str)
}

public func arrayDataToStringWithSpaceAndComma(content: [Int]) -> String {
    let str = content.reduce("") { $0 + ", \($1)" }
    guard !str.isEmpty else {
        return str
    }
    return gettingSpacesInTheBeginingOfStr(str: str)
}

public func arrayDataToStringWithThreeSpaces(content: [Int]) -> String {
    let str = content.reduce("") { $0 + "   \($1)" }
    guard !str.isEmpty else {
        return str
    }
    return gettingSpacesInTheBeginingOfStr(str: str)
}

public func arrayDataStringToStringWithThreeSpaces(content: [String]) -> String {
    let str = content.reduce("") { $0 + "   \($1)" }
    guard !str.isEmpty else {
        return str
    }
    return gettingSpacesInTheBeginingOfStr(str: str)
}

public func gettingSpacesInTheBeginingOfStr(str: String) -> String {
    var returnStr = str
    guard !returnStr.isEmpty else {
        return returnStr
    }
    while returnStr.first == " " || returnStr.first == "," {
        returnStr.removeFirst()
    }
    return returnStr
}

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
