//
//  ContentView.swift
//  iHabit
//
//  Created by Oleg Gavashi on 12.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ActivitiesListView()
            .environment(\.colorScheme, .dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
