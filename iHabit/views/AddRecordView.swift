//
//  AddRecordView.swift
//  iHabit
//
//  Created by Oleg Gavashi on 13.09.2023.
//

import SwiftUI

struct AddRecordView: View {
    @State private var date: Date = Date()
    
    @ObservedObject var activities: Activities
    
    let index: Int
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    DatePicker("Date of record", selection: $date)
                        .preferredColorScheme(.dark)
                }
            }
            .navigationTitle("Add record")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        addRecord()
                    } label: {
                        Text("Add")
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
            }
        }
    }
    
    func addRecord() {
        let record = ActivityRecord(date: date)
        activities.items[index].records.append(record)
        dismiss()
    }
}
