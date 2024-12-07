//
//  Today.swift
//  AnswerAI-iOS
//
//  Created by Angel Prieto on 12/5/24.
//

import SwiftUI

struct Today: View {
    
    @State public var page: AppStorePage = .today
    
    @State public var expandedID: String? = nil
    
    func HomeBarButtonLabel(pageType: AppStorePage) -> some View {
        // Creates label for HomeBarButton based on pageType.
        
        switch pageType {
        case .today:
            return Label("Today", systemImage: "text.rectangle.page")
        case .games:
            return Label("Games", image: "rocket")
        case .apps:
            return Label("Apps", systemImage: "square.stack.3d.up.fill")
        case .arcade:
            return Label("Arcade", image: "app.arcade")
        case .search:
            return Label("Search", systemImage: "magnifyingglass")
        }
        
    }
    
    func HomeBarButton(pageType: AppStorePage) -> some View {
        // Creates home bar button based on pageType.
        
        Group {
            
            Button() {
                page = pageType
            } label: {
                HomeBarButtonLabel(pageType: pageType)
            }
            
            .disabled(page == pageType)
            
        }
        
    }
    
    let color =  Color.init(hex: 0x1E1C20)
    let app1 = "app-001"
    
    var body: some View {
        
        
        ZStack() {
            color
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            let x = AppCardDetailed(expandedID: $expandedID)
            
            ScrollView {
                
                AppCard(id: app1, height: 500, fullWidth: false, expandedID: $expandedID, info: InfoManager.getInfo(cardID: app1))
                    
                AppCard(id: "app-002", height: 500, fullWidth: false, expandedID: $expandedID, info: InfoManager.getInfo(cardID: app1))
            }
            .overlay {
                let anyExpanded = expandedID != nil
                if anyExpanded {
                    
                    Group {
                        
                            x
                            .transition(.identity)
                            .onAppear() {
                                withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.7)) {}
                            }
                        Spacer()
                    }
                        
                }
            }
            
        }
        .tabItem {
            HomeBarButton(pageType: .today)
        }
        .toolbarVisibility((expandedID != nil ? .hidden: .visible), for: .tabBar)
        
    }
}


