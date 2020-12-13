//
//  SaveGameRowView.swift
//  Loterias Da Sorte
//
//  Created by Gabriel Soria Souza on 12/12/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

struct GameDetailRow {
    let color: Color
    let numbers: [String]
}

struct SaveGameRowView: View {
    
    let gameData: GameDetailRow
    @State var selectedNumbers: Binding<[String]>
    
    var body: some View {
        GeometryReader { geo in
            HStack(alignment: .center, spacing: 0) {
                ForEach(0..<self.gameData.numbers.count) { item in
                    Button(self.gameData.numbers[item], action: {
                        //action
                    }).frame(width: geo.size.width / CGFloat(self.gameData.numbers.count), height: 40, alignment: .center)
                    .background(self.gameData.color)
                    .border(Color.black, width: 1)
                    .buttonStyle(HighlightButtonStyle(defaultColor: self.gameData.color))
                }
            }.frame(width: geo.size.width, height: 40, alignment: .center)
        }.foregroundColor(.white).frame(height: 40)
    }
}

struct HighlightButtonStyle: ButtonStyle {
    
    var defaultColor: Color
    
    init(defaultColor: Color) {
        self.defaultColor = defaultColor
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .black : .white)
            .background(configuration.isPressed ? Color.white : self.defaultColor)
    }
}

struct SaveGameRowView_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
//        SaveGameRowView(gameData: GameDetailRow(color: .green,
//                                                numbers: ["01", "02", "03", "04", "05", "06"]))
    }
}
