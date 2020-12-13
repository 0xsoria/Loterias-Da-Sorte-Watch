//
//  SaveGameCompleteGrid.swift
//  Loterias Da Sorte
//
//  Created by Gabriel Soria Souza on 13/12/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Lottery
import SwiftUI

struct SaveGameCompleteGrid: View {
    
    let data: [[String]]
    let lotteryColor: Color
    @EnvironmentObject var selectedNumbers: SelectedValues
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ForEach(0..<self.data.count) { item in
                SaveGameRowView(gameData: GameDetailRow(color: self.lotteryColor,
                                                        numbers: self.data[item]))
                    .environmentObject(self.selectedNumbers).padding(1)
            }
        }
    }
}

struct SaveGameCompleteGrid_Previews: PreviewProvider {
    
    @State var nbrs = [String]()
    
    static var previews: some View {
        SaveGameCompleteGrid(data: SavedGamesDataForRow.getNumbers(for: .megasena),
                             lotteryColor: LotteryGames.megasena.colorFromGame().newColor).environmentObject(SelectedValues())
    }
}
