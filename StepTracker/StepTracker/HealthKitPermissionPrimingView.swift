//
//  HealthKitPermissionPrimingView.swift
//  StepTracker
//
//  Created by Adrian Castañeda on 24/07/25.
//

import SwiftUI

struct HealthKitPermissionPrimingView: View {
    
    var descrition: String = """
 This app displays your steps and weight data in interactive charts.
 
 you can also add new step or weight data to Apple Health form this app. Your data is private and secured
 """
    
    var body: some View {
        VStack(spacing: 130) {
            VStack(alignment: .leading, spacing: 10) {
                Image(.appleHealth)
                    .resizable()
                    .frame(width: 90,height: 90)
                    .shadow(color: .gray.opacity(0.3), radius: 16)
                    .padding(.bottom, 12)
                Text("Apple Health Integration")
                    .font(.title2)
                    .bold()
                
                Text(descrition)
                    .foregroundStyle(.secondary)
                
            }
            Button("Connect Apple Health") {
                // do code later
            }
            .buttonStyle(.borderedProminent)
            .tint(.pink)
        }
        .padding(30)
    }
}

#Preview {
    HealthKitPermissionPrimingView()
}
