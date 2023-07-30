//
//  HomeView.swift
//  GamingApp
//
//  Created by Gytis Ptašinskas on 2023-07-30.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 1
    let tabNames = ["News", "Games", "Deals", "Events", "NFT"]
    var gameItems: [GameItem]
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(0..<tabNames.count, id: \.self) { index in
                            Button(action: {
                                withAnimation(.easeInOut) {
                                    self.selectedTab = index
                                }
                            }) {
                                VStack {
                                    Text(tabNames[index])
                                        .foregroundColor(selectedTab == index ? Color(UIColor.systemBlue) : Color(UIColor.label))
                                        .fontWeight(selectedTab == index ? .bold : .regular)
                                        .padding(.bottom, -5)
                                    
                                    Rectangle()
                                        .frame(height: 3)
                                        .foregroundColor(selectedTab == index ? .blue : .clear)
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width / CGFloat(tabNames.count))
                        }
                    }
                }
                
                TabView(selection: $selectedTab) {
                    NewsView()
                        .tag(0)
                    GamesView(gameItems: gameItems)
                        .tag(1)
                    DealsView()
                        .tag(2)
                    EventsView()
                        .tag(3)
                    NFTView()
                        .tag(4)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(maxHeight: .infinity)
            }
            .padding(.top, 10)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // TODO : NotificationView
                    } label: {
                        Image(systemName: "bell.badge")
                            .renderingMode(.original)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color(UIColor.systemBlue),Color(UIColor.label))
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Nexplay")
                        .font(.title)
                }
            }
        }
    }
}





struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(gameItems: GameItems)
    }
}
