//
//  InfoManager.swift
//  AnswerAI-iOS
//
//  Created by Angel Prieto on 12/7/24.
//

import SwiftUI

class InfoManager {
    
    static func getInfo(cardID: String) -> Dictionary<String, AnyObject> {
        
        if let path = Bundle.main.path(forResource: "AppInfo", ofType: "json") {
            do {
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                if let result = jsonResult as? Dictionary<String, AnyObject>, let app = result[cardID] as? Dictionary<String, AnyObject> {
                    return app
                }
            } catch {
                print("Error reading JSON file: \(error)")
            }
        }
        
        return Dictionary<String, AnyObject>()
    }
}
