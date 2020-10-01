//
//  MainLotteryView.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 29/09/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

enum LotteryName: String {
    case megaSena
}

protocol Lottery {
    var name: LotteryName { get set }
}

protocol LastLotteryResultable {
    var lotteries: [Lottery] { get set }
    func getLastResultsFor(lottery: LotteryName)
}

final class LastLotteryResults: LastLotteryResultable {
    
    var lotteries: [Lottery] = []
    
    func getLastResultsFor(lottery: LotteryName) {
        
    }
}

struct MainLotteryView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct MainLotteryView_Previews: PreviewProvider {
    static var previews: some View {
        MainLotteryView()
    }
}
