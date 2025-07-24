//
//  ContentView.swift
//  StepTracker
//
//  Created by Adrian Castañeda on 22/07/25.
//

import SwiftUI

enum HealthMetricContext: CaseIterable, Identifiable {
    case steps
    case wegith
    var id: Self { self }
    
    var title: String {
        switch self {
        case .steps:
            return "Steps"
        case .wegith:
            return "Weight"
        }
    }
    
}

struct DashboardView: View {
    @AppStorage("hasSeenPermissionPriming") private var hasSeenPermissionPriming = false
    @State private var isShowingPermissionPrimingSheet: Bool = false
    @State private var selectedStat: HealthMetricContext = .steps
    
    var isStepts: Bool { selectedStat == .steps }
    var body: some View {
        NavigationStack {
            ScrollView {
                Picker("Selected Stat", selection: $selectedStat) {
                    ForEach(HealthMetricContext.allCases) {
                        Text($0.title)
                    }
                }
                .pickerStyle(.segmented)
                VStack(spacing: 20) {
                    VStack {
                        NavigationLink(value: selectedStat) {
                            HStack {
                                VStack(alignment:.leading){
                                    Label("Steps",systemImage: "figure.walk")
                                        .font(.title3)
                                        .bold()
                                        .foregroundStyle(.pink)
                                    Text("Avg: 10k Steps")
                                        .font(.caption)
                                       
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                  
                            }
                            .padding(.bottom,12)
                        }
                        .foregroundStyle(.secondary)
                        
                        
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.secondary)
                            .frame(height: 150)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(
                            cornerRadius: 12)
                        .fill(
                            Color(.secondarySystemBackground))
                    )
                }
                
                VStack {
                    VStack(alignment:.leading) {

                            VStack(alignment:.leading){
                                Label("Averages",systemImage: "calendar")
                                    .font(.title3)
                                    .bold()
                                    .foregroundStyle(.pink)
                                Text("Last 28 Days")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.bottom,12)
            
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.secondary)
                            .frame(height: 240)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(
                            cornerRadius: 12)
                        .fill(
                            Color(.secondarySystemBackground))
                    )
                }
                
            }
            .padding()
            .onAppear {
                isShowingPermissionPrimingSheet = !hasSeenPermissionPriming
            }
            .navigationTitle("Dashboard")
            .navigationDestination(for: HealthMetricContext.self) { metric in
                HealthDataListView(metric: metric)
            }
            .sheet(
                isPresented: $isShowingPermissionPrimingSheet) {
                    // fetch health data
                } content: {
                    HealthKitPermissionPrimingView(hasSeen: $hasSeenPermissionPriming)
                }

        }
        .tint(isStepts ? .pink : .indigo)
    }
}

#Preview {
    DashboardView()
        .environment(HealthKitManager())
}
