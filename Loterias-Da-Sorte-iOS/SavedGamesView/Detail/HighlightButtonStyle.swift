//
//  HighlightButtonStyle.swift
//  Loterias-Da-Sorte
//
//  Created by Gabriel Soria Souza on 13/12/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

struct HighlightButtonStyle: ButtonStyle {
    
    var defaultColor: Color
    var isSelected: Bool
    
    init(defaultColor: Color, isSelected: Bool) {
        self.defaultColor = defaultColor
        self.isSelected = isSelected
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .black : .white)
    }
}
