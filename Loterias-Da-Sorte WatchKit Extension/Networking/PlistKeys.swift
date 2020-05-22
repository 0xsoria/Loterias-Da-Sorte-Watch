//
//  PlistKeys.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

public enum PlistKey: String {
    
    case lotteryAPIKEY = "LOTTERY_API_KEY"
    case lotteryAPIURL = "LOTTERY_API_URL"
    
    
    func getData() -> String {
        switch self {
        case .lotteryAPIKEY:
            return Bundle.main.object(forInfoDictionaryKey: "LOTTERY_API_KEY") as? String ?? ""
        case .lotteryAPIURL:
            return Bundle.main.object(forInfoDictionaryKey: "LOTTERY_API_URL") as? String ?? ""
        }
    }
}
