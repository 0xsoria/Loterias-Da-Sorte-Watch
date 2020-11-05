//
//  MockNetwork.swift
//  Loterias-Da-Sorte-iOS
//
//  Created by Gabriel Soria Souza on 04/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation

final class MockNetwork: NetworkServiceable {
    
    let fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func request(url: String, completion: @escaping ((Result<Data, NetworkError>) -> Void)) {
        let file = Bundle.main.url(forResource: self.fileName, withExtension: "json")!
        let data = try! Data(contentsOf: file)
        completion(.success(data))
    }
}

enum MockFileName: String {
    case mega = "SenaLast"
    case quina = "QuinaLast"
    case lotofacil = "LotoFacilLast"
    case lotomania = "LotoManiaLast"
    case dupla = "DuplaSenaLast"
    case time = "TimeLast"
    case dia = "DiaLast"
    case federal = "FederalLast"
    
    static func fileName(lottery: LotteryGamesNoSpace) -> MockFileName {
        switch lottery {
        case .megasena:
            return .mega
        case .quina:
            return .quina
        case .lotofacil:
            return .lotofacil
        case .lotomania:
            return .lotomania
        case .duplasena:
            return .dupla
        case .timemania:
            return .time
        case .diadesorte:
            return .dia
        case .federal:
            return .federal
        }
    }
}
