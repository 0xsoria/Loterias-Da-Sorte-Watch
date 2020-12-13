//
//  SelectedValues.swift
//  Loterias Da Sorte
//
//  Created by Gabriel Soria Souza on 13/12/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import SwiftUI

final class SelectedValues: ObservableObject {
    @Published var values = Set<String>()
    
    func cleanSelectedNumbers() {
        self.values.removeAll()
    }
}
