//
//   MainViewRow.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 04/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Lottery
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
            CompleteRow(game: self.gameDetail.gameData)
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
        MainViewRow(gameDetail: GameDetailModel(gameData: MockModel.mockedData()), isExpanded: true, tapAction: {}, remove: {})
    }
}
