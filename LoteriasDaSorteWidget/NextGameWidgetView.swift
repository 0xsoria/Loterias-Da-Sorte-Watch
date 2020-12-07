//
//  NextGameWidgetView.swift
//  LoteriasDaSorteWidgetExtension
//
//  Created by Gabriel Soria Souza on 06/12/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Lottery
import Network
import SwiftUI

struct NextGameWidgetView: View {
    
    let model: GameDetailModel
    
    var body: some View {
        ZStack {
            self.model.gameData.lotteryGame.colorFromGame().newColor
            VStack {
                Spacer()
                Text(model.gameData.lotteryGame.rawValue).fontWeight(.bold).font(.title2)
                Spacer()
                Text("Próximo Jogo").fontWeight(.bold)
                Text(model.gameData.nextGame.date)
                Spacer()
                Text("Prêmio Estimado").fontWeight(.bold)
                Text(model.gameData.nextGame.prize)
                Spacer()
            }.foregroundColor(.white)
        }
    }
}
