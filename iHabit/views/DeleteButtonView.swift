//
//  DeleteButton.swift
//  iHabit
//
//  Created by Oleg Gavashi on 13.09.2023.
//

import SwiftUI

struct DeleteButton: View {
    @Environment(\.editMode) var editMode
    
    let onDelete: (IndexSet) -> ()
    
    let records: [ActivityRecord]
    let record: ActivityRecord
    
    var body: some View {
        if editMode?.wrappedValue == .active {
            Button {
                if let index = records.firstIndex(of: record) {
                    onDelete(IndexSet(integer: index))
                }
            } label: {
                Image(systemName: "minus.circle.fill")
                    .foregroundColor(.red)
            }
            .offset(x: 5, y: -5)
        }
    }
}
