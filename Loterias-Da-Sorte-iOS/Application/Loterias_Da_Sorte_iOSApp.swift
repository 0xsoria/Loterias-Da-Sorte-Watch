//
//  Loterias_Da_Sorte_iOSApp.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 29/09/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

@main
struct Loterias_Da_Sorte_iOSApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            TabView {
                MainLotteryView()
                    .tabItem {
                        Text("Loterias")
                        Image("bw")
                    }
                SettingView()
                    .tabItem {
                        Text("Configurações")
                        Image("settings")
                    }
            }
        }
    }
}
