//
//  CompleteRow.swift
//  Loterias-Da-Sorte
//
//  Created by Gabriel Soria Souza on 08/11/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Lottery
import SwiftUI

struct CompleteRow: View {
    
    let game: LotteryModel
    
    var body: some View {
        VStack {
            Text(self.game.lotteryGame.rawValue)
                .font(.largeTitle)
            if self.game.lotteryGame == .some(.federal) {
                Spacer()
                FederalView(game: self.game)
            } else {
                Spacer()
                HStack {
                    VStack {
                        Spacer()
                        Text("Concurso \(self.game.concourseNumber)")
                        Spacer()
                        Text(self.game.date)
                        Spacer()
                    }
                    Spacer(minLength: 25)
                    Text(self.game.numbersString)
                }
                Spacer(minLength: 15)
                if self.game.lotteryGame == .some(.timemania) {
                    Text("Time do coração: \(self.game.teamOrDay ?? String())")
                    Spacer(minLength: 15)
                } else if self.game.lotteryGame == .some(.diadesorte) {
                    Text("Dia de sorte: \(self.game.teamOrDay ?? String())")
                    Spacer(minLength: 15)
                }
                Spacer()
                Text(self.game.resultChecker())
            }
            
        }.font(.title2)
        .foregroundColor(self.game.lotteryGame.colorFromGame().newColor)
        .multilineTextAlignment(.center)
    }
}

struct CompleteRow_Previews: PreviewProvider {
    static var previews: some View {
        CompleteRow(game: MockModel.mockedData())
    }
}
