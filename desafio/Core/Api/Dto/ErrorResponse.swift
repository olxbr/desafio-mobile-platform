//
//  ErrorResponse.swift
//  desafio
//
//  Created by Victor Valfre on 12/07/21.
//

import Foundation
import Foundation

public class ErrorResponse: Codable, Error {
    public let code: Int
    public let stackTrace: String
    
    public init(code: Int, stackTrace: String) {
        self.code = code
        self.stackTrace = stackTrace
    }
}
