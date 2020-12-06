//
//  LotteryColor.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 17/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

public enum LotteryColor {
    case megasena
    case quina
    case lotofacil
    case lotoMania
    case timeMania
    case duplaSena
    case defaultText
    case whiteGray
    case diaDeSorte
    case federal
    
    public var color: UIColor {
        switch self {
        case .megasena:
            return UIColor.spc_from(r: 33, g: 152, b: 105)
        case .quina:
            return UIColor.spc_from(r: 38, g: 0, b: 200)
        case .lotofacil:
            return UIColor.spc_from(r: 164, g: 80, b: 140)
        case .lotoMania:
            return UIColor.spc_from(r: 247, g: 156, b: 50)
        case .timeMania:
            return UIColor.spc_from(r: 254, g: 219, b: 44)
        case .duplaSena:
            return UIColor.spc_from(r: 163, g: 47, b: 83)
        case .whiteGray:
            return UIColor.spc_from(r: 245, g: 241, b: 250)
        case .diaDeSorte:
            return UIColor.spc_from(r: 203, g: 133, b: 44)
        case .federal:
            return UIColor.spc_from(r: 15, g: 48, b: 153)
        case .defaultText:
            return UIColor.black
        }
    }
}
