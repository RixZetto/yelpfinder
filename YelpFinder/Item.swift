//
//  Item.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 2/04/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
