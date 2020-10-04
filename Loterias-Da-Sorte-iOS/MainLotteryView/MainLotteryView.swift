//
//  MainLotteryView.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 29/09/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

protocol Lottery {
    var name: LotteryName { get set }
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
