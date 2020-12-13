//
//  SavedGamesView.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 29/09/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Lottery
import SwiftUI

protocol GameSavable: ObservableObject {
    func save(lottery: LotteryGames, numbers: [String], concourseNumber: String)
}

final class GameSaver: GameSavable, ObservableObject {
    func save(lottery: LotteryGames, numbers: [String], concourseNumber: String) {
        
    }
}

struct SavedGamesView: View {
    
    @State private var text = String()
    private let lottery: LotteryGames
    @EnvironmentObject var selectedNumbers: SelectedValues
    @StateObject var gameSaver: GameSaver = GameSaver()
    
    init(lottery: LotteryGames) {
        self.lottery = lottery
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: nil) {
                Spacer()
                Text("Concurso").padding(.trailing).padding(.leading)
                TextField("Digite o número aqui", text: self.$text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading)
                    .padding(.trailing)
                Spacer()
            }
            Spacer()
            SaveGameCompleteGrid(data: SavedGamesDataForRow.getNumbers(for: self.lottery),
                                 lotteryColor: self.lottery.colorFromGame().newColor)
                .environmentObject(self.selectedNumbers)
            Spacer()
            HStack {
                Spacer()
                Button(action: {}, label: {
                    Text("Salvar")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }).frame(width: 100, height: 50, alignment: .center)
                .background(self.lottery.colorFromGame().newColor)
                .cornerRadius(20)
                Spacer()
                Button(action: self.cleanSelectedNumbers, label: {
                    Text("Limpar").fontWeight(.bold).foregroundColor(.white)
                }).frame(width: 100, height: 50, alignment: .center)
                .background(self.lottery.colorFromGame().newColor)
                .cornerRadius(20)
                Spacer()
            }
            Spacer()
        }.navigationTitle(self.lottery.rawValue)
    }
    
    private func saveGame() {
        
    }
    
    private func cleanSelectedNumbers() {
        self.selectedNumbers.cleanSelectedNumbers()
    }
}

struct SavedGamesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SavedGamesView(lottery: .timemania).environmentObject(SelectedValues())
        }
    }
}
