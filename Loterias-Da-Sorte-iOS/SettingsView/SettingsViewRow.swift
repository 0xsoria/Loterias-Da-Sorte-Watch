//
//  SettingsViewRow.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 27/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

struct SettingsViewRow: View {
    
    var imageName: String
    var title: String
    var action: (() -> Void)
    
    var body: some View {
        Button(action: self.action, label: {
            HStack {
                Image(self.imageName)
                Text(self.title)
            }
        })
    }
}

struct SettingsViewRow_Previews: PreviewProvider {
    static var previews: some View {
        SettingsViewRow(imageName: String(), title: String(), action: {
            print("actioooon")
        })
    }
}
