//
//  ActivitiesList.swift
//  iHabit
//
//  Created by Oleg Gavashi on 12.09.2023.
//

import Foundation

class Activities: ObservableObject {
    @Published var items = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "items") {
            if let decoded = try? JSONDecoder().decode([Activity].self, from: savedItems) {
                items = decoded
                
                return
            }
        }
        items = []
    }
}
