//
//  AnalyticsManager.swift
//  TodoListApp
//
//  Created by German Hernandez on 2/12/21.
//

import Foundation
import FirebaseAnalytics

protocol AnalyticsManagerProtocol {
    static func track(for event: AnalyticsEvent, key: String, value: Any)
}

final class AnalyticsManager: AnalyticsManagerProtocol {
    
    // MARK: - Methods
    static func track(for event: AnalyticsEvent, key: String, value: Any) {
        Analytics.logEvent(event.rawValue, parameters: [key: value])
    }
}
