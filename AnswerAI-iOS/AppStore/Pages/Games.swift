//
//  Games.swift
//  AnswerAI-iOS
//
//  Created by Angel Prieto on 12/5/24.
//

import SwiftUI

struct Games: View {
    
    let color = Color.white
    
    var body: some View {
        
        ZStack() {
            color
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            Text("Games")
        }
        
    }
}
