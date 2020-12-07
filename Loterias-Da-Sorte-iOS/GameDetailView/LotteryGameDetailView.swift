//
//  GameDetailView.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 04/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Lottery
import Network
import SwiftUI

struct LotteryGameDetailView: View {
    
    @StateObject var gameResults = GameDetailResult(service: LotteryNetworkService(networkService: NetworkService()))
    @State private var alert = false
    @State private var errorLoadingAlert = false
    var game: GameDetailModel
    var onDisappear: (() -> Void)
    
    var body: some View {
        Group {
            if self.gameResults.game != nil {
                self.listWithButtonStack
            } else {
                ProgressView()
                    .scaleEffect(1.5)
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }.onAppear(perform: {
            self.gameResults.setBackup(game: self.game)
            self.searchNewGame(with: game.gameData.concourseNumber)
            self.cleanGames()
            UITableViewCell.appearance().selectionStyle = .none
        }).navigationBarItems(leading: Button(action: {
            self.shareLotteryGame()
        }, label: {
            Image(systemName: "square.and.arrow.up.fill")
        }),trailing: Button(action: {
            self.alert.toggle()
        }, label: {
            Image(systemName: "magnifyingglass.circle.fill")
        }))
        .actionSheet(isPresented: self.$alert) {
            ActionSheet(title: Text("Deseja ver algum jogo específico?"),
                        message: Text("Toque em procurar e digite o número do jogo que você deseja ver"),
                        buttons: [.default(Text("Procurar"),
                                           action: {
                                            self.showAlertWithTextField(with: "Digite o número do jogo que você deseja ver", message: nil, placeholder: "Número do jogo", actionTitle: "Procurar", cancelTitle: "Voltar") { number in
                                                self.searchNewGame(with: number)
                                            }
                                           }), .cancel(Text("Cancelar"))])
        }.alert(isPresented: self.$errorLoadingAlert, content: {
            Alert(title: Text("Ops!"),
                  message: Text("Erro ao carregar o jogo, tente novamente!"),
                  primaryButton: .default(Text("Tentar novamente"), action: {
                    self.searchNewGame(with: self.gameResults.game?.gameData.concourseNumber ?? "")
                  }), secondaryButton: .default(Text("Cancelar")))
        })
        .navigationBarTitle(self.game.gameData.lotteryGame.rawValue, displayMode: .inline)
    }
    
    var listWithButtonStack: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Button(action: {
                        self.searchGame(number: -1)
                    }, label: {
                        Image(systemName: "arrowshape.turn.up.left.fill")
                    }).padding(.leading)
                    Spacer()
                    Button(action: {
                        self.searchGame(number: 1)
                    }, label: {
                        Image(systemName: "arrowshape.turn.up.right.fill")
                    }).padding(.trailing)
                }.frame(width: geo.size.width, height: 45, alignment: .center)
                self.newList
            }
        }
    }
    
    var newList: some View {
        List {
            ForEach(self.gameResults.game?.gameDetailContent ?? []) { item in
                VStack(alignment: .leading, spacing: 10) {
                    Text(item.title).font(.title)
                    Text(item.content).font(.title2)
                }.foregroundColor(self.game.gameData.lotteryGame
                                    .colorFromGame().newColor)
            }
        }
    }
    
    private func shareLotteryGame() {
        if let game = self.gameResults.game?.gameData {
            let sharedContent = ShareDataContent(game: game).sharedString(lotteryGame: game.lotteryGame)
            let activityController = UIActivityViewController(activityItems: [sharedContent], applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(activityController, animated: true, completion: nil)
        }
    }
    
    private func searchNewGame(with number: String) {
        self.gameResults.getResultsFor(gameNumber: number, and: self.game.gameData.lotteryGameNoSpace, completionError: { error in
            if error {
                self.errorLoadingAlert = true
            }
        })
    }
    
    private func searchGame(number: Int) {
        guard let game = self.gameResults.game,
              let concourseNumber =  Int(game.gameData.concourseNumber) else { return }
        let sum =  concourseNumber + number
        self.searchNewGame(with: String(sum))
    }
    
    private func cleanGames() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.onDisappear()
        }
    }
}

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LotteryGameDetailView(game: GameDetailModel(gameData: MockModel.mockedData()), onDisappear: {})
    }
}
