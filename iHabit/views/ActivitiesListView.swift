//
//  ActivitiesListView.swift
//  iHabit
//
//  Created by Oleg Gavashi on 12.09.2023.
//

import SwiftUI

struct ActivitiesListView: View {
    @StateObject var activities = Activities()
    
    @State private var showAdd = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) { activity in
                    NavigationLink {
                        ActivityView(activities: activities, activity: activity)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(activity.name)
                                    .font(.headline)
                                if !activity.records.isEmpty {
                                    Text("Started \(activity.records[0].formattedDate)")
                                        .font(.caption)
                                        .opacity(0.5)
                                }
                            }
                            .padding(.vertical, 1)
                        }
                    }
                }
            }
            .navigationTitle("iHabit")
            .toolbar {
                Button {
                    showAdd = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAdd) {
                AddActivityView(activities: activities)
            }
        }
    }
}

struct ActivitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesListView()
    }
}
