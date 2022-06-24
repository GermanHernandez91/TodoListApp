//
//  Logger.swift
//  TodoListApp
//
//  Created by German Hernandez on 2/12/21.
//

import Foundation
import OSLog

let logger = Logger()

final class AppLogger {
    
    static func log(for level: OSLogType, with message: String) {
        logger.log(level: level, "\(message)")
    }
}
