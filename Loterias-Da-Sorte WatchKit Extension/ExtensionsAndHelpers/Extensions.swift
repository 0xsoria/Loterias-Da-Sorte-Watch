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

func stringToLotteryProperty(gameName: String) -> Lottery {
    switch gameName {
    case LotteryGames.megasena.rawValue:
        return Lottery(quantityOfNumbersToBeDraw: MegaSenaLottery().quantityOfNumbersToBeDraw, minimumQuantityOfNumbersYouChoose: MegaSenaLottery().minimumQuantityOfNumbersYouChoose, maxQuantityOfNumbersYouChoose: MegaSenaLottery().maxQuantityOfNumbersYouChoose, quantityOfNumbersAvailable: MegaSenaLottery().quantityOfNumbersAvailable, nameOfTheGame: MegaSenaLottery().nameOfTheGame, nameOfTheGameWOSpaces: MegaSenaLottery().nameOfTheGameWOSpaces, rangeOfNumbersYouChoose: MegaSenaLottery().rangeOfNumbersYouChoose, quantityOfNumbersNecessaryToWin: MegaSenaLottery().quantityOfNumbersNecessaryToWin, drawnNumbers: MegaSenaLottery().drawnNumbers, concourseNumber: MegaSenaLottery().councourseNumber, teamOrData: nil, duplaSenaSecondSet: nil, federalPrize: nil)
    case LotteryGames.quina.rawValue:
        return Lottery(quantityOfNumbersToBeDraw: QuinaLottery().quantityOfNumbersToBeDraw,
                       minimumQuantityOfNumbersYouChoose: QuinaLottery().minimumQuantityOfNumbersYouChoose,
                       maxQuantityOfNumbersYouChoose: QuinaLottery().maxQuantityOfNumbersYouChoose,
                       quantityOfNumbersAvailable: QuinaLottery().quantityOfNumbersAvailable,
                       nameOfTheGame: QuinaLottery().nameOfTheGame, nameOfTheGameWOSpaces: QuinaLottery().nameOfTheGameWOSpaces,
                       rangeOfNumbersYouChoose: QuinaLottery().rangeOfNumbersYouChoose,
                       quantityOfNumbersNecessaryToWin: QuinaLottery().quantityOfNumbersNecessaryToWin,
                       drawnNumbers: QuinaLottery().drawnNumbers,
                       concourseNumber: QuinaLottery().councourseNumber, teamOrData: nil, duplaSenaSecondSet: nil, federalPrize: nil)
    case LotteryGames.lotofacil.rawValue:
        return Lottery(quantityOfNumbersToBeDraw: LotoFacilLottery().quantityOfNumbersToBeDraw,
                       minimumQuantityOfNumbersYouChoose: LotoFacilLottery().minimumQuantityOfNumbersYouChoose,
                       maxQuantityOfNumbersYouChoose: LotoFacilLottery().maxQuantityOfNumbersYouChoose,
                       quantityOfNumbersAvailable: LotoFacilLottery().quantityOfNumbersAvailable,
                       nameOfTheGame: LotoFacilLottery().nameOfTheGame, nameOfTheGameWOSpaces: LotoFacilLottery().nameOfTheGameWOSpaces,
                       rangeOfNumbersYouChoose: LotoFacilLottery().rangeOfNumbersYouChoose,
                       quantityOfNumbersNecessaryToWin: LotoFacilLottery().quantityOfNumbersNecessaryToWin,
                       drawnNumbers: LotoFacilLottery().drawnNumbers,
                       concourseNumber: LotoFacilLottery().councourseNumber, teamOrData: nil, duplaSenaSecondSet: nil, federalPrize: nil)
    case LotteryGames.timemania.rawValue:
        return Lottery(quantityOfNumbersToBeDraw: TimeManiaLottery().quantityOfNumbersToBeDraw, minimumQuantityOfNumbersYouChoose: TimeManiaLottery().minimumQuantityOfNumbersYouChoose, maxQuantityOfNumbersYouChoose: TimeManiaLottery().maxQuantityOfNumbersYouChoose, quantityOfNumbersAvailable: TimeManiaLottery().quantityOfNumbersAvailable, nameOfTheGame: TimeManiaLottery().nameOfTheGame, nameOfTheGameWOSpaces: TimeManiaLottery().nameOfTheGameWOSpaces, rangeOfNumbersYouChoose: TimeManiaLottery().rangeOfNumbersYouChoose, quantityOfNumbersNecessaryToWin: TimeManiaLottery().quantityOfNumbersNecessaryToWin, drawnNumbers: TimeManiaLottery().drawnNumbers, concourseNumber: TimeManiaLottery().councourseNumber, teamOrData: TimeManiaLottery().teamOrData, duplaSenaSecondSet: TimeManiaLottery().duplaSenaSecondSet, federalPrize: TimeManiaLottery().federalPrize)
    case LotteryGames.duplasena.rawValue:
        return Lottery(quantityOfNumbersToBeDraw: DuplaSenaLottery().quantityOfNumbersToBeDraw, minimumQuantityOfNumbersYouChoose: DuplaSenaLottery().minimumQuantityOfNumbersYouChoose, maxQuantityOfNumbersYouChoose: DuplaSenaLottery().maxQuantityOfNumbersYouChoose, quantityOfNumbersAvailable: DuplaSenaLottery().quantityOfNumbersAvailable, nameOfTheGame: DuplaSenaLottery().nameOfTheGame, nameOfTheGameWOSpaces: DuplaSenaLottery().nameOfTheGameWOSpaces, rangeOfNumbersYouChoose: DuplaSenaLottery().rangeOfNumbersYouChoose, quantityOfNumbersNecessaryToWin: DuplaSenaLottery().quantityOfNumbersNecessaryToWin, drawnNumbers: DuplaSenaLottery().drawnNumbers, concourseNumber: DuplaSenaLottery().councourseNumber, teamOrData: DuplaSenaLottery().teamOrData, duplaSenaSecondSet: DuplaSenaLottery().duplaSenaSecondSet, federalPrize: DuplaSenaLottery().federalPrize)
    case LotteryGames.lotomania.rawValue:
        return Lottery(quantityOfNumbersToBeDraw: LotoManiaLottery().quantityOfNumbersToBeDraw, minimumQuantityOfNumbersYouChoose: LotoManiaLottery().minimumQuantityOfNumbersYouChoose, maxQuantityOfNumbersYouChoose: LotoManiaLottery().maxQuantityOfNumbersYouChoose, quantityOfNumbersAvailable: LotoManiaLottery().quantityOfNumbersAvailable, nameOfTheGame: LotoManiaLottery().nameOfTheGame, nameOfTheGameWOSpaces: LotoManiaLottery().nameOfTheGameWOSpaces, rangeOfNumbersYouChoose: LotoManiaLottery().rangeOfNumbersYouChoose, quantityOfNumbersNecessaryToWin: LotoManiaLottery().quantityOfNumbersNecessaryToWin, drawnNumbers: LotoManiaLottery().drawnNumbers, concourseNumber: LotoManiaLottery().councourseNumber, teamOrData: LotoManiaLottery().teamOrData, duplaSenaSecondSet: LotoManiaLottery().duplaSenaSecondSet, federalPrize: LotoManiaLottery().federalPrize)
    case LotteryGames.diadesorte.rawValue:
        return Lottery(quantityOfNumbersToBeDraw: DiaDeSorteLottery().quantityOfNumbersToBeDraw, minimumQuantityOfNumbersYouChoose: DiaDeSorteLottery().minimumQuantityOfNumbersYouChoose, maxQuantityOfNumbersYouChoose: DiaDeSorteLottery().maxQuantityOfNumbersYouChoose, quantityOfNumbersAvailable: DiaDeSorteLottery().quantityOfNumbersAvailable, nameOfTheGame: DiaDeSorteLottery().nameOfTheGame, nameOfTheGameWOSpaces: DiaDeSorteLottery().nameOfTheGameWOSpaces, rangeOfNumbersYouChoose: DiaDeSorteLottery().rangeOfNumbersYouChoose, quantityOfNumbersNecessaryToWin: DiaDeSorteLottery().quantityOfNumbersNecessaryToWin, drawnNumbers: DiaDeSorteLottery().drawnNumbers, concourseNumber: DiaDeSorteLottery().councourseNumber, teamOrData: DiaDeSorteLottery().teamOrData, duplaSenaSecondSet: DiaDeSorteLottery().duplaSenaSecondSet, federalPrize: DiaDeSorteLottery().federalPrize)
    case LotteryGames.federal.rawValue:
        return Lottery(quantityOfNumbersToBeDraw: FederalLottery().quantityOfNumbersToBeDraw, minimumQuantityOfNumbersYouChoose: FederalLottery().minimumQuantityOfNumbersYouChoose, maxQuantityOfNumbersYouChoose: FederalLottery().maxQuantityOfNumbersYouChoose, quantityOfNumbersAvailable: FederalLottery().quantityOfNumbersAvailable, nameOfTheGame: FederalLottery().nameOfTheGame, nameOfTheGameWOSpaces: FederalLottery().nameOfTheGameWOSpaces, rangeOfNumbersYouChoose: FederalLottery().rangeOfNumbersYouChoose, quantityOfNumbersNecessaryToWin: FederalLottery().quantityOfNumbersNecessaryToWin, drawnNumbers: FederalLottery().drawnNumbers, concourseNumber: FederalLottery().councourseNumber, teamOrData: FederalLottery().teamOrData, duplaSenaSecondSet: FederalLottery().duplaSenaSecondSet, federalPrize: FederalLottery().federalPrize)
    default:
        return Lottery(quantityOfNumbersToBeDraw: MegaSenaLottery().quantityOfNumbersToBeDraw, minimumQuantityOfNumbersYouChoose: MegaSenaLottery().minimumQuantityOfNumbersYouChoose, maxQuantityOfNumbersYouChoose: MegaSenaLottery().maxQuantityOfNumbersYouChoose, quantityOfNumbersAvailable: MegaSenaLottery().quantityOfNumbersAvailable, nameOfTheGame: MegaSenaLottery().nameOfTheGame, nameOfTheGameWOSpaces: MegaSenaLottery().nameOfTheGameWOSpaces, rangeOfNumbersYouChoose: MegaSenaLottery().rangeOfNumbersYouChoose, quantityOfNumbersNecessaryToWin: MegaSenaLottery().quantityOfNumbersNecessaryToWin, drawnNumbers: MegaSenaLottery().drawnNumbers, concourseNumber: MegaSenaLottery().councourseNumber, teamOrData: nil, duplaSenaSecondSet: nil, federalPrize: nil)
    }
}

/**
 It receives the game (worker) chosen by user and transforms in the type **Lottery**.
 */
func transformingLotteryPropertiesInLottery(sender: LotteryProperties) -> Lottery {
    return Lottery(quantityOfNumbersToBeDraw: sender.quantityOfNumbersToBeDraw, minimumQuantityOfNumbersYouChoose: sender.minimumQuantityOfNumbersYouChoose, maxQuantityOfNumbersYouChoose: sender.maxQuantityOfNumbersYouChoose, quantityOfNumbersAvailable: sender.quantityOfNumbersAvailable, nameOfTheGame: sender.nameOfTheGame, nameOfTheGameWOSpaces: sender.nameOfTheGameWOSpaces, rangeOfNumbersYouChoose: sender.rangeOfNumbersYouChoose, quantityOfNumbersNecessaryToWin: sender.quantityOfNumbersNecessaryToWin, drawnNumbers: sender.drawnNumbers, concourseNumber: sender.councourseNumber, teamOrData: sender.teamOrData, duplaSenaSecondSet: sender.duplaSenaSecondSet, federalPrize: sender.federalPrize)
}
