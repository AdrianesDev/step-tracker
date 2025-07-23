//
//  HealthDataListView.swift
//  StepTracker
//
//  Created by Adrian Castañeda on 22/07/25.
//

import SwiftUI

struct HealthDataListView: View {
    var metric: HealthMetricContext
    @State private var isShowingAddData: Bool = false
    @State private var dataDate: Date = .now
    @State private var valueToAdd: String = ""
    var body: some View {
        List(0..<28) { i in
            HStack {
                Text(Date(), format: .dateTime.month().day().year())
                Spacer()
                Text(100000, format: .number.precision(.fractionLength(metric == .steps ? 0 : 1)))
            }
        }
        .navigationTitle(metric.title)
        .sheet(isPresented: $isShowingAddData) {
            addDataView
        }
        .toolbar {
            Button("Add Data", systemImage: "plus") {
                isShowingAddData = true
            }
        }
    }
    
    var addDataView: some View {
        NavigationStack {
            Form {
                DatePicker(
                    "Date",
                    selection: $dataDate,
                    displayedComponents: .date
                )
                HStack {
                    Text(metric.title)
                    Spacer()
                    TextField("Value", text: $valueToAdd)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 140)
                        .keyboardType(
                            metric == .steps ? .numberPad : .decimalPad
                        )
                }
                
            }
            .navigationTitle(metric.title)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Data") {
                        //Do code later
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Dissmiss") {
                        isShowingAddData = false
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        HealthDataListView(metric: .steps)
    }
}
