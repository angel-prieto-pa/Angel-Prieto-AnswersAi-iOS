//
//  Color.swift
//  AnswerAI-iOS
//
//  Created by Angel Prieto on 12/3/24.
//

import SwiftUI

extension Color {
    // Custom function to add specific hex colors.
    
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}
