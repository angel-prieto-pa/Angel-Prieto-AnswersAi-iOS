//
//  AppCardDetailed.swift
//  AnswerAI-iOS
//
//  Created by Angel Prieto on 12/4/24.
//

import SwiftUI
import LocalAuthentication

struct AppCardDetailed: View {
    
    @Binding public var expandedID: String?
    
    /* MARK: Functions */
    
    func toggleStyle(interaction: AppCardInteraction) {
        if ((expandedID == nil) && (interaction == .tap)) || ((expandedID != nil) && (interaction == .dismiss)) {
            expandedID = nil
        }
    }
    
    /* MARK: body */
    var body: some View {

        ZStack(alignment: .topTrailing) {
                
            // Background
            Color.init(hex: 0x211005)
                .ignoresSafeArea()
            
            // Makes app page with details scrollable.
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    
                    // The app's app card.
                    AppCard(id: expandedID ?? "", height: 500.0, fullWidth: true, expandedID: $expandedID, info: InfoManager.getInfo(cardID: expandedID ?? ""))
                    
                    ZStack {
                            
                        Group {
                            Text("**Whether you're an**")
                                    .foregroundStyle(Color.white)
                                
                                
                            + Text(" ultramarathoner, a triathlete, or a total beginner, this virtual running coach can help you find your stride- and a supportive community.\n\n What we love: The holisitic approach of Runna's personalized fitness plans. Get real-time audio tips on pace and gait as you run as well as reminders to the rest. When you're on the move, the app may offer nutrition guidance or suggest cross-training workouts like strength-building or Pilates.\n\n Using your running experience and training schedule, Runa can estimate your marathon time. Record your runs (or sync with compatible apps) to see your cadence, average heart rate, and other stats.\nQuick tip: When you select an upcoming race, as your overall goal in Runna-say, the Honolulu Marathon-you'll gain access to a dedicated page on the Community tab connecting you to others training for the same race.\n Meet the creator: Cofounder Dom Maskell and pro running coach Ben Parker launched Runna in 2021. The roughly 50-person London-based team includes runners of all skill levels, including beginners, four-minute milers, and Ironman competitors.")
                                    .foregroundStyle(Color.gray)
                                
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 25)
                        .font(.body)
                        .fontWeight(.medium)
                            
                    }
                    .padding(.bottom, 30)
                    .opacity(expandedID != nil ? 1: 0)
                    .frame(alignment: .top)
                        
                Divider()
                    .background(Color.gray.opacity(0.9))
                        
                ShareLink(item: URL(string: "https://apps.apple.com/us/app/runna-running-training-plans/id1594204443")!) {
                
                    Label("Share Story", systemImage: "square.and.arrow.up")
                    
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 30)
                .background(Color.init(hex: 0x3F3D41))
                .cornerRadius(10)
                .foregroundStyle(Color.white)
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.vertical, 30)
                        
                        
            }
                    
                    
 
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                
                
                
        let dismissDimension = UIScreen.main.bounds.height * 0.0350
                
        Button() {
                self.toggleStyle(interaction: .dismiss)
        } label: {
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .frame(width: dismissDimension, height: dismissDimension)
                    .opacity(0.85)
                    .foregroundStyle(Color.white)
                    
        }
        .zIndex(1)
        .offset(x: -30.0, y: 30.0)
                
    }
    .ignoresSafeArea()
    .transition(.identity)
    .onAppear() {
        withAnimation(
            .interactiveSpring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.7)) {}
        }
    }
}

#Preview {
    AppStore()
}
