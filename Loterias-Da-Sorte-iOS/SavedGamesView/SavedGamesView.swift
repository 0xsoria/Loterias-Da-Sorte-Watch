//
//  SavedGamesView.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 29/09/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Lottery
import SwiftUI

struct SavedGamesView: View {
    
    @State private var text = String()
    @State private var selectedNumbers = [String]()
    private let lottery: LotteryGames
    
    init(lottery: LotteryGames) {
        self.lottery = lottery
    }
    
    var body: some View {
        NavigationView {
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
                SaveGameCompleteGrid(data: SavedGamesDataForRow.getNumbers(for: self.lottery), lotteryColor: self.lottery.colorFromGame().newColor, selectedNumbers: self.$selectedNumbers)
                Spacer()
                Text("Esse concurso ainda não aconteceu")
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
                    Button(action: {}, label: {
                        Text("Limpar").fontWeight(.bold).foregroundColor(.white)
                    }).frame(width: 100, height: 50, alignment: .center)
                    .background(self.lottery.colorFromGame().newColor)
                        .cornerRadius(20)
                    Spacer()
                }
                Spacer()
            }.navigationTitle(self.lottery.rawValue)
        }
    }
}

struct SavedGamesView_Previews: PreviewProvider {
    static var previews: some View {
        SavedGamesView(lottery: .megasena)
    }
}
