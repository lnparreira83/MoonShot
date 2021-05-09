//
//  Mission.swift
//  Moonshot
//
//  Created by Lucas Parreira on 14/04/21.
//

import Foundation


struct Mission:Codable,Identifiable{
    
    struct CrewRole:Codable {
        let name:String
        let role:String
    }
    
    let id:Int
    let launchDate:Date?
    let crew:[CrewRole]
    let description:String
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
    
    var displayName:String{
        "Apollo \(id)"
    }
    
    var image:String{
        "apollo\(id)"
    }
    
    
}
