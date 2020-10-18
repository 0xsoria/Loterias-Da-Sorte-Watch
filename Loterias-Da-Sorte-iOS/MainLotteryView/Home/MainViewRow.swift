//
//   MainViewRow.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 04/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

struct MainViewRow: View {
    
    //MARK: - State
    @State var isLoading: Bool = false
    
    //MARK: - Propertoes
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
        VStack {
            HStack {
                Spacer()
                Text(gameDetail.gameData.lotteryGame.rawValue)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                Spacer(minLength: 5)
                if !self.isExpanded && !self.isLoading {
                    Button(action: self.loadDetails, label: {
                        Image(systemName: "info.circle.fill")
                    })
                } else if !self.isExpanded && self.isLoading {
                    ProgressView()
                        .scaleEffect(1.5)
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
        }.foregroundColor(self.gameDetail.gameData.lotteryGame.colorFromGame().newColor)
    }
    
    var completeView: some View {
        VStack {
            Text(self.gameDetail.gameData.lotteryGame.rawValue)
                .font(.largeTitle)
            if self.gameDetail.gameData.lotteryGame == .some(.federal) {
                Spacer()
                self.federalView
            } else {
                Spacer()
                HStack {
                    VStack {
                        Spacer()
                        Text("Concurso \(self.gameDetail.gameData.concourseNumber)")
                        Spacer()
                        Text(self.gameDetail.gameData.date)
                        Spacer()
                    }
                    Spacer(minLength: 25)
                    Text(arrayDataStringToStringWithThreeSpaces(content: self.gameDetail.gameData.numbers))
                }
                Spacer(minLength: 15)
                if self.gameDetail.gameData.lotteryGame == .some(.timemania) {
                    Text("Time do coração: \(self.gameDetail.gameData.teamOrDay ?? String())")
                    Spacer(minLength: 15)
                } else if self.gameDetail.gameData.lotteryGame == .some(.diadesorte) {
                    Text("Dia de sorte: \(self.gameDetail.gameData.teamOrDay ?? String())")
                    Spacer(minLength: 15)
                }
                Spacer()
                Text(self.gameDetail.gameData.resultChecker())
            }
            
        }.font(.title2)
        .foregroundColor(self.gameDetail.gameData.lotteryGame.colorFromGame().newColor)
        .multilineTextAlignment(.center)
    }
    
    var federalView: some View {
        VStack {
            Text("Concurso \(self.gameDetail.gameData.concourseNumber)")
                .font(.title2)
            Spacer()
            Text("\(self.gameDetail.gameData.date)")
                .font(.title2)
            Spacer()
            HStack {
                Spacer()
                VStack {
                    Text("Bilhete 1")
                    Text(self.gameDetail.gameData.federalPrize?[0].bilhete ?? "Erro ao carregar")
                }
                Spacer()
                VStack {
                    Text("Bilhete 2")
                    Text(self.gameDetail.gameData.federalPrize?[1].bilhete ?? "Erro ao carregar")
                }
                Spacer()
                VStack {
                    Text("Bilhete 3")
                    Text(self.gameDetail.gameData.federalPrize?[2].bilhete ?? "Erro ao carregar")
                }
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                VStack {
                    Text("Bilhete 4")
                    Text(self.gameDetail.gameData.federalPrize?[3].bilhete ?? "Erro ao carregar")
                }
                Spacer()
                VStack {
                    Text("Bilhete 5")
                    Text(self.gameDetail.gameData.federalPrize?[4].bilhete ?? "Erro ao carregar")
                }
                Spacer()
            }
        }
        .font(.title3)
        
    }
    
    //MARK: - Methods
    private func loadDetails() {
        self.isLoading = true
        self.tapAction()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
            self.isLoading = false
        }
    }
}

struct MainViewRow_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
    }
}
