//
//  AppCard.swift
//  AnswerAI-iOS
//
//  Created by Angel Prieto on 12/3/24.
//

import SwiftUI
import LocalAuthentication

enum AppCardStyle {
    case appCard
    case appCardDetailed
}

enum AppCardInteraction {
    case tap
    case dismiss
}

struct AppCard: View {
    
    @Binding public var expandedID: String?
    
    private var fullWidth: Bool
    
    private var cardID: String
    
    private var cardHeight: CGFloat
    private var cardWidth: CGFloat
    
    private var cardRounding: CGFloat
    
//    private var jsonResult: Dictionary<String, AnyObject>?
    
    @State private var info: AnyObject
    
    
    @State private var background: String
    @State private var icon: String
    
    @State private var all: AnyObject? = nil
    
    var body: some View {
        
        do {print("startof", self.background, "done", cardID)}
        
        return self.AppCard()
        
    }
    
    
    /* MARK: init */
    
    init(id: String, height: CGFloat, fullWidth: Bool, expandedID: Binding<String?>, info: Dictionary<String, AnyObject>) {
        
        self._expandedID = expandedID
        
        self.fullWidth = fullWidth
        
        self.cardID = id
        
        self.cardHeight = height
        self.cardWidth = (fullWidth ? UIScreen.main.bounds.width : UIScreen.main.bounds.width - 40)
        
        self.cardRounding = (fullWidth ? 0.0 : 25.0)
        
        self.info = info as AnyObject
        print("init", info)
        self.background = info["background"] as? String ?? ""
        self.icon = info["icon"] as? String ?? ""
    }
    
    func toggleStyle(interaction: AppCardInteraction) {
    
        if ((expandedID == nil) && (interaction == .tap)) || ((expandedID != nil) && (interaction == .dismiss)) {
            expandedID = self.cardID
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {

            let reason = "need to unlock"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                
                if success {
                    // authenticated successfull
                } else {
                    
                }
            }
        } else {
            // no biometrics
        }
    }
    
    func AppCard() -> some View {
        
        ZStack(alignment: .bottom) {

            // App background image.
            Image(self.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            // App background image with blur and fade effect added.
            Image(self.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .blur(radius: 25, opaque: true)
                .mask(LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: .clear, location: 0.50),
                        .init(color: .black, location: 0.70) ]),
                    
                    startPoint: .top,
                    endPoint: .bottom
                ))
            
            // Tint added with to image with a fade effect.
            Color.init(hex: 0x161616)
                .opacity(0.60)
                .mask(LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: .clear, location: 0.40),
                        .init(color: .black, location: 0.70) ]),
                    
                    startPoint: .top,
                    endPoint: .bottom
                ))
            
            // Dimensions for app download section.
            let downloadSpaceHeight = cardHeight * 0.15
            let iconDimensions = downloadSpaceHeight * 0.60
            
            // Divider holding app downlaod section.
            Color.init(hex: 0x161616)
                .opacity(0.15)
                .frame(height: downloadSpaceHeight)
            
            // App card text overlaying app background image.
            VStack(alignment: .leading) {
                
                Text("APPS WE LOVE")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.gray)
                    .opacity(0.85)
                
                
                Text("Hit the Ground Running With Runna")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                
                Text("Training plans for your next marathon or run around the park.")
                    .font(.caption2)
                    .fontWeight(.light)
                    .foregroundStyle(Color.gray)
                    .opacity(0.85)
                
                HStack {
                    /* App downlaod section assets. */
                    
                    // App icon.
                    Image(self.icon)
                        .resizable()
                        .frame(width: iconDimensions, height: iconDimensions)
                    
                    VStack(alignment: .leading) {
                        /* Title and category. */
                        
                        // Title.
                        Text("Runna: Running Training Plans")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundStyle(Color.white)
                        
                        // Category.
                        Text("5k, 10k, Half, Marathon, Ultra")
                            .font(.caption)
                            .fontWeight(.regular)
                            .foregroundStyle(Color.gray)
                            .opacity(0.85)
                    }
                    
                    Spacer()
                    
                    VStack {
                        /* Donwload button. */
                        
                        // Get button.
                        Button("Get") {
                            authenticate()
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 4)
                        .background(Color.gray)
                        .cornerRadius(20)
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .padding(2)
                        
                        // Button label.
                        Label("In-App Purchases", image: "rocket")
                            .font(.system(size: 7))
                            .fontWeight(.medium)
                            .foregroundStyle(Color.gray)
                            .opacity(0.85)
                            .labelStyle(.titleOnly)
                    }
                    
                }
                .frame(height: downloadSpaceHeight)
                .padding(.top, 5)
                
            }
            .containerRelativeFrame(.horizontal, alignment: .center) { size, axis in
                            size - 40
            }
            
        }
        .frame(/*width: cardWidth,*/ height: cardHeight, alignment: .center)
        .containerRelativeFrame(.horizontal, alignment: .center) { size, axis in
                        size
        }
        .clipped()
        .cornerRadius(cardRounding)
        .onTapGesture {
            self.toggleStyle(interaction: .tap)
        }
        .scaleEffect(cardID == expandedID ? 1: 0.9)
        .animation(.easeInOut, value: cardID == expandedID)
        
    }
    
}

