//
//  AddActivityView.swift
//  iHabit
//
//  Created by Oleg Gavashi on 12.09.2023.
//

import SwiftUI

struct AddActivityView: View {
    @ObservedObject var activities: Activities
    
    @State private var title: String = ""
    @State private var description: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $title)
                
                Section("Details") {
                    TextEditor(text: $description)
                }
            }
            .navigationTitle("New activity")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        addActivity()
                    } label: {
                        Text("Add")
                    }
                    .disabled(title.isEmpty || description.isEmpty)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
            }
            .preferredColorScheme(.dark)
        }
    }
    
    func addActivity() {
        let newActivity = Activity(name: title, description: description, records: [ActivityRecord]())
        activities.items.append(newActivity)
        dismiss()
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(activities: Activities())
    }
}
