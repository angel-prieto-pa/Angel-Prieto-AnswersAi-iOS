//
//  AppStore.swift
//  AnswerAI-iOS
//
//  Created by Angel Prieto on 12/5/24.
//

import SwiftUI
import UIKit

enum AppStorePage: String, CaseIterable {
    case today
    case games
    case apps
    case arcade
    case search
}

struct AppStore: View {
    
    @State public var page: AppStorePage = .today
    
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
    
    
    var body: some View {

            TabView {
                Group {
                    
                    Today()
                        .opacity(page == .today ? 1 : 0)
                        .zIndex(page == .today ? 1 : 0)
                        
                        
                    
                    Games()
                        .opacity(page == .games ? 1 : 0)
                        .zIndex(page == .games ? 1 : 0)
                        .tabItem {
                            HomeBarButton(pageType: .games)
                        }
                    
                    Apps()
                        .opacity(page == .apps ? 1 : 0)
                        .zIndex(page == .apps ? 1 : 0)
                        .tabItem {
                            HomeBarButton(pageType: .apps)
                        }
                    
                    Arcade()
                        .opacity(page == .arcade ? 1 : 0)
                        .zIndex(page == .arcade ? 1 : 0)
                        .tabItem {
                            HomeBarButton(pageType: .arcade)
                        }
                    
                    Search()
                        .opacity(page == .search ? 1 : 0)
                        .zIndex(page == .search ? 1 : 0)
                        .tabItem {
                            HomeBarButton(pageType: .search)
                        }
                        
                }
                
                
                
            }
            .onAppear {
                let appearance = UITabBarAppearance()
                appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
                appearance.backgroundColor = UIColor(Color.black.opacity(0.2))
                
                // For appearance when scrolling behind the TabView.
                UITabBar.appearance().standardAppearance = appearance
                // For appearance when scrolled all the way up.
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
            
            
    }
}
