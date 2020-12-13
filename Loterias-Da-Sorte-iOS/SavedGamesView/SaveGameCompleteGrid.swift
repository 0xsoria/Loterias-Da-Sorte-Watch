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
    @State var selectedNumbers: Binding<[String]>
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ForEach(0..<self.data.count) { item in
                SaveGameRowView(gameData: GameDetailRow(color: self.lotteryColor,
                                                        numbers: self.data[item]), selectedNumbers: self.selectedNumbers)
            }
        }
    }
}

struct SaveGameCompleteGrid_Previews: PreviewProvider {
    
    @State var nbrs = [String]()
    
    static var previews: some View {
        Text("")
        //SaveGameCompleteGrid(data: SavedGamesDataForRow.getNumbers(for: .megasena), lotteryColor: LotteryGames.megasena.colorFromGame().newColor, selectedNumbers: self.$nbrs)
    }
}
