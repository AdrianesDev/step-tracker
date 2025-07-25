//
//  HealthMetric.swift
//  StepTracker
//
//  Created by Adrian Castañeda on 25/07/25.
//

import Foundation

struct HealthMetric: Identifiable {
    let id = UUID()
    let date: Date
    let value: Double
}
