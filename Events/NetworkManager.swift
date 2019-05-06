//
//  NetworkManager.swift
//  Events
//
//  Created by Mihikaa Goenka on 5/5/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import Foundation
import Alamofire

struct User:Codable{
    var token:String
}

class NetworkManager{
    
    private static let endpoint = "http://35.237.240.249/api/events/getAll/"
    private static let postEndpoint = "http://35.237.240.249/api/events/create/"
    
    static func getEvents(completion: @escaping ([Events]) -> Void) {
        Alamofire.request(endpoint, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let EventResponse = try? jsonDecoder.decode(EventResponse.self, from: data){
                    let events = EventResponse.data.events
                    completion(events)
                } else{
                    print("Invalid Response")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func postEvents(name: String, date:String, time: String, tags:String, organizerName: String, organizerContanct: String, description:String, dorm_id: String){
        let parameters: [String: Any] = [
            "name": name,
            "date": date,
            "time": time,
            "tags": tags,
            "description": description,
            "organizerName": organizerName,
            "organizerContact": organizerContanct,
            "dorm_id": dorm_id
        ]
        Alamofire.request(postEndpoint, method: .post, parameters: parameters, encoding:JSONEncoding.default).validate().responseData {response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let response = try? jsonDecoder.decode(User.self, from:data){
                    print("received token \(response.token)")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
