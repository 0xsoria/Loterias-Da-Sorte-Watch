//
//  NextGameRow.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 14/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

struct MainNextGameRow: View {
    
    //MARK: - State
    @State var isLoading: Bool = false
    
    //MARK: - Properties
    var gameDetail: GameDetailModel
    var isExpanded: Bool
    var tapAction: (() -> Void)
    var remove: (() -> Void)
    
    //MARK: - Views
    var body: some View {
        if !self.isExpanded {
            simpleView
                .contentShape(Rectangle())
                .onTapGesture {
                    self.loadDetails()
                }
                .frame(height: 60)
        } else {
            completeView
        }
    }
    
    var simpleView: some View {
        HStack {
            Spacer()
            Text(gameDetail.gameData.lotteryGame.rawValue)
                .multilineTextAlignment(.center)
                .font(.largeTitle)
            if !self.isExpanded && !self.isLoading {
                Spacer()
                Button(action: self.loadDetails, label: {
                    Image(systemName: "info.circle.fill")
                })
            } else if !self.isExpanded && self.isLoading {
                Spacer()
                ProgressView()
                    .scaleEffect(1.5)
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }.foregroundColor(self.gameDetail.gameData.lotteryGame.colorFromGame().newColor)
    }
    
    var completeView: some View {
        HStack {
            Spacer()
            VStack(alignment: .center, spacing: 10) {
                Text(gameDetail.gameData.lotteryGame.rawValue)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                Text("Concurso \(self.gameDetail.gameData.nextGame.concourseNumber)")
                Text(self.gameDetail.gameData.nextGame.date)
                Text("Premio estimado: \(self.gameDetail.gameData.nextGame.prize)").font(.title3)
            }.font(.title2)
            .multilineTextAlignment(.center)
            Spacer()
        }.foregroundColor(self.gameDetail.gameData.lotteryGame.colorFromGame().newColor)
        .font(.title2)
    }
    
    private func loadDetails() {
        self.isLoading = true
        self.tapAction()
    }
    
    private func notExpanded() {
        self.remove()
    }
}

struct MainNextGameRow_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
    }
}
