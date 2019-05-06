//
//  EventAPI.swift
//  Events
//
//  Created by Aditya on 05/05/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import Foundation

class EventAPI {
    static func getFilters() -> [Filter] {
        var filters: [Filter] = []
        filters.append(contentsOf: Tags.allValues().map({ f in f as Filter }))
        return filters
    }
}

