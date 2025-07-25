//
//  StepTrackerApp.swift
//  StepTracker
//
//  Created by Adrian Castañeda on 22/07/25.
//

import SwiftUI

@main
struct StepTrackerApp: App {
    let hkManager = HealthKitManager()
    
    var body: some Scene {
        WindowGroup {
            DashboardView()
                .environment(hkManager)
        }
    }
}
