//
//  File.swift
//  
//
//  Created by Gabriel Soria Souza on 05/11/20.
//

import Foundation

public enum DoubleIntLottery: Codable, Equatable {
    case int(Int)
    case double(Double)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .int(x)
            return
        }
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        
        throw DecodingError.typeMismatch(DoubleIntLottery.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for DoubleIntLottery"))
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let x):
            try container.encode(x)
        case .int(let x):
            try container.encode(x)
        }
    }
    
    func returnString() -> String {
        switch self {
        case .int(let x):
            return String(x)
        case .double(let x):
            return String(x)
        }
    }
}
