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
    @EnvironmentObject var selectedNumbers: SelectedValues
    
    var body: some View {
        GeometryReader { geo in
            HStack(alignment: .center, spacing: 0) {
                ForEach(0..<self.gameData.numbers.count) { item in
                    Button(self.gameData.numbers[item], action: {
                        self.appendNumber(self.gameData.numbers[item])
                    }).frame(width: geo.size.width / CGFloat(self.gameData.numbers.count), height: 40, alignment: .center)
                    .background(Circle().fill(self.gameData.color))
                    .buttonStyle(HighlightButtonStyle(defaultColor: self.gameData.color,
                                                      isSelected: self.selectedNumbers.values.contains(self.gameData.numbers[item])))
                }
            }.frame(width: geo.size.width, height: 40, alignment: .center)
        }.foregroundColor(.white).frame(height: 40)
    }
    
    private func appendNumber(_ number: String) {
        self.selectedNumbers.values.insert(number)
    }
}

struct SaveGameRowView_Previews: PreviewProvider {
    static var previews: some View {
        SaveGameRowView(gameData: GameDetailRow(color: .green,
                                                numbers: ["01", "02", "03", "04", "05", "06", "07", "08"]))
            .environmentObject(SelectedValues()).previewDevice(PreviewDevice(rawValue: "iPhone SE (1st generation)"))
    }
}
