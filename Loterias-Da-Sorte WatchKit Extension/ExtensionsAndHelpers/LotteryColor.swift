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
    
    public var newColor: Color {
        switch self {
        case .megasena:
            return Color.init(self.color)
        case .quina:
            return Color.init(self.color)
        case .lotofacil:
            return Color.init(self.color)
        case .lotoMania:
            return Color.init(self.color)
        case .timeMania:
            return Color.init(self.color)
        case .duplaSena:
            return Color.init(self.color)
        case .whiteGray:
            return Color.init(self.color)
        case .diaDeSorte:
            return Color.init(self.color)
        case .federal:
            return Color.init(self.color)
        case .defaultText:
            return Color.black
        }
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
}

extension UIColor {
    
    /// Takes integer values for Red, Green, and Blue channels to make
    /// creating colors from RGB a bit easier.
    ///
    /// Note: Assertions will fire during development if inappropriate values are passed.
    ///
    /// - Parameters:
    ///   - r: An integer between 0 and 255 representing the red channel value
    ///   - g: An integer between 0 and 255 representing the green channel value
    ///   - b: An integer between 0 and 255 representing the blue channel value
    ///   - a: A CGFloat between 0.0 and 1.0 representing the alpha (0.0 is transparent, 1.0 is opaque).
    /// - Returns: The created UIColor
    public static func spc_from(r: Int, g: Int, b: Int, a: CGFloat = 1.0) -> UIColor {
        assert((0 <= r && r <= 255), "Use a red value between 0 and 255!")
        assert((0 <= g && g <= 255), "Use a green value between 0 and 255!")
        assert((0 <= b && b <= 255), "Use a blue value between 0 and 255!")
        assert((0.0 <= a && a <= 1.0), "Use and alpha value between 0 and 1!")
        return UIColor(red: CGFloat(r) / 255.0,
                       green: CGFloat(g) / 255.0,
                       blue: CGFloat(b) / 255.0,
                       alpha: a)
    }
}
