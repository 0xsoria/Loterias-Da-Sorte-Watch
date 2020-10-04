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

