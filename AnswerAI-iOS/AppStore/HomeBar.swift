//
//  HomeBar.swift
//  AnswerAI-iOS
//
//  Created by Angel Prieto on 12/3/24.
//

import SwiftUI

/* MARK: - HomeBar */

struct HomeBar {
    
    /* MARK: Variables */
    
    @Binding public var page: AppStorePage
    
    /* MARK: Functions*/
    
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
    
}

/* MARK: - HomeBarLabelStyle */

struct HomeBarLabelStyle: LabelStyle {
    // Custom LabelStyle in order to have icons on top and text at the bottom.
    
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .center) {
            configuration.icon
            configuration.title
        }
    }
}
