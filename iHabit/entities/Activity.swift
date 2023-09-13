//
//  Activity.swift
//  iHabit
//
//  Created by Oleg Gavashi on 12.09.2023.
//

import Foundation

struct Activity: Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
    var records: [ActivityRecord]
    
    
}
