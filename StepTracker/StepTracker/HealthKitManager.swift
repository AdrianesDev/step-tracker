//
//  HealthKitManager.swift
//  StepTracker
//
//  Created by Adrian Castañeda on 24/07/25.
//

import Foundation
import HealthKit
import Observation

@Observable class HealthKitManager {
    let store = HKHealthStore()
    
    let types: Set = [HKQuantityType(.stepCount), HKQuantityType(.bodyMass)]
}
