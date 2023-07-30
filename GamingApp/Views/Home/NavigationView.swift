//
//  NavigationView.swift
//  GamingApp
//
//  Created by Gytis Ptašinskas on 2023-07-30.
//

import SwiftUI

struct TabNavigationView: View {
    var body: some View {
        TabView{
            HomeView(gameItems: GameItems)
                .tabItem {
                    Label("Menu", systemImage: "house")
                }
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "safari.fill")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            InboxView()
                .tabItem {
                    Label("Inbox", systemImage: "text.bubble.fill")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
    }
}
