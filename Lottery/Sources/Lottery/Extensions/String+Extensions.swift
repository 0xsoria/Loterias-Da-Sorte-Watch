//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 05/11/20.
//

import Foundation

func gettingSpacesInTheBeginingOfStr(str: String) -> String {
    var returnStr = str
    guard !returnStr.isEmpty else {
        return returnStr
    }
    while returnStr.first == " " || returnStr.first == "," {
        returnStr.removeFirst()
    }
    return returnStr
}

func arrayDataToStringWithDash(content: [Int]) -> String {
    let str = content.reduce("") { $0 + "-\($1)" }
    guard !str.isEmpty else {
        return str
    }
    return gettingSpacesInTheBeginingOfStr(str: str)
}

func arrayDataToStringWithSpaceAndComma(content: [Int]) -> String {
    let str = content.reduce("") { $0 + ", \($1)" }
    guard !str.isEmpty else {
        return str
    }
    return gettingSpacesInTheBeginingOfStr(str: str)
}

func arrayDataToStringWithThreeSpaces(content: [Int]) -> String {
    let str = content.reduce("") { $0 + "   \($1)" }
    guard !str.isEmpty else {
        return str
    }
    return gettingSpacesInTheBeginingOfStr(str: str)
}

func arrayDataStringToStringWithThreeSpaces(content: [String]) -> String {
    let str = content.reduce("") { $0 + "   \($1)" }
    guard !str.isEmpty else {
        return str
    }
    return gettingSpacesInTheBeginingOfStr(str: str)
}

extension String {
    func convertToDecimal() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "pt_BR")
        
        if let prizeAsNumber = Double(self) {
            return numberFormatter.string(from: NSNumber(value: prizeAsNumber)) ?? self
        } else if let prizeAsInt = Int(self) {
            return numberFormatter.string(from: NSNumber(value: prizeAsInt)) ?? self
        } else {
            return self
        }
    }
    
    func lotteryDateFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let formatter = ISO8601DateFormatter()
        if let date = formatter.date(from: self) {
            return dateFormatter.string(from: date)
        } else {
            return self
        }
    }
}
