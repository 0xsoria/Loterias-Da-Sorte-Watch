//
//  NextGameRequester.swift
//  Loterias-Da-Sorte WatchKit Extension
//
//  Created by Gabriel Soria Souza on 21/05/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

final class NextGameRequester: ObservableObject {
    
    private let requester = Requester()
    var lottery: LotteryGames?
    
}
