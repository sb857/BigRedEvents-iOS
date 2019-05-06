//
//  Event.swift
//  Events
//
//  Created by Mihikaa Goenka on 5/5/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import Foundation

class Events: Codable {
    
    var name : String
    var date: String
    var time: String
    var tags: String
    var organizerName: String
    var organizerContact: String
    var description: String
    
    
    init(name: String, date : String, time : String, tags:String, organizerName: String, organizerContact: String, description: String) {
        self.name = name
        self.date = date
        self.time = time
        self.tags = tags
        self.description = description
        self.organizerName = organizerName
        self.organizerContact = organizerContact
        
    }
}

struct EventDataResponse: Codable {
    var events: [Events]
}
struct EventResponse: Codable {
    var data: EventDataResponse
}
