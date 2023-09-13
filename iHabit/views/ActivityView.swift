//
//  ActivityView.swift
//  iHabit
//
//  Created by Oleg Gavashi on 12.09.2023.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var activities: Activities
    
    @Environment(\.editMode) var editMode
    
    @State private var isPresented = false
    
    let activity: Activity
    
    var index: Int {
        activities.items.firstIndex(where: {$0.id == activity.id})!
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Description")
                            .font(.title)
                            .bold()
                            .padding(.vertical)
                        Text(activity.description)
                    }
                    .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            ForEach(activity.records) { record in
                                VStack {
                                    VStack {
                                        Image(systemName: "calendar.badge.clock")
                                            .font(.system(size: 40))
                                            .padding(.bottom, 5)
                                        Text(record.formattedDateDetailed)
                                    }
                                    .padding()
                                }
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(DeleteButton(onDelete: deleteRecord, records: activity.records, record: record), alignment: .topTrailing)
                                .padding(.vertical)
                            }
                            .onDelete(perform: deleteRecord)
                        }
                    }
                }
            }
        }
        .toolbar {
            if !activity.records.isEmpty {
                ToolbarItem(placement: .confirmationAction) {
                    EditButton()
                }
            }
            
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    isPresented = true
                }label: {
                    Image(systemName: "note.text.badge.plus")
                }
            }
            
        }
        .navigationTitle(activity.name)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isPresented) {
            AddRecordView(activities: activities, index: index)
        }
    }
    
    func deleteRecord(at offsets: IndexSet) {
        
        if let index = activities.items.firstIndex(where: { $0.id == activity.id} ) {
            withAnimation {
                activities.items[index].records.remove(atOffsets: offsets)
            }
            if activities.items[index].records.isEmpty {
                editMode?.wrappedValue = .inactive
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        let activities = Activities()
        
        ActivityView(activities: activities, activity: activities.items[0])
    }
}
