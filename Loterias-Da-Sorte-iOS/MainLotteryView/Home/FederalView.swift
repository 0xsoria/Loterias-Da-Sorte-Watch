//
//  FederalView.swift
//  Loterias-Da-Sorte
//
//  Created by Gabriel Soria Souza on 08/11/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Lottery
import SwiftUI

struct FederalView: View {
    
    let game: LotteryModel
    
    var body: some View {
        VStack {
            Text("Concurso \(self.game.concourseNumber)")
                .font(.title2)
            Spacer()
            Text("\(self.game.date)")
                .font(.title2)
            Spacer()
            HStack {
                Spacer()
                VStack {
                    Text("Bilhete 1")
                    Text(self.game.federalPrize?[0].bilhete ?? "Erro ao carregar")
                }
                Spacer()
                VStack {
                    Text("Bilhete 2")
                    Text(self.game.federalPrize?[1].bilhete ?? "Erro ao carregar")
                }
                Spacer()
                VStack {
                    Text("Bilhete 3")
                    Text(self.game.federalPrize?[2].bilhete ?? "Erro ao carregar")
                }
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                VStack {
                    Text("Bilhete 4")
                    Text(self.game.federalPrize?[3].bilhete ?? "Erro ao carregar")
                }
                Spacer()
                VStack {
                    Text("Bilhete 5")
                    Text(self.game.federalPrize?[4].bilhete ?? "Erro ao carregar")
                }
                Spacer()
            }
        }
        .font(.title3)
    }
}

struct FederalView_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
    }
}
