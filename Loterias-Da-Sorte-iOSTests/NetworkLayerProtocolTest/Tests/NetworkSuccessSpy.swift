//
//  NetworkSuccessSpy.swift
//  Loterias-Da-Sorte-iOSTests
//
//  Created by Gabriel Soria Souza on 03/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Foundation
@testable import Loterias_Da_Sorte_iOS

final class NetworkSpy: NetworkServiceable {
    func request(url: String, completion: @escaping ((Result<Data, NetworkError>) -> Void)) {
        let file = Bundle.main.url(forResource: "SenaLast", withExtension: "json")!
        let data = try! Data(contentsOf: file)
        completion(.success(data))
    }
}

