//
//  GamesView.swift
//  GamingApp
//
//  Created by Gytis Ptašinskas on 2023-07-30.
//

import SwiftUI

struct GamesView: View {
    var images: [String] = ["topRated_1", "topRated_2", "topRated_3", "topRated_4", "topRated_5"]
    @State private var selectedImageIndex: Int = 0
    @State private var directionForward: Bool = true
    var gameItems: [GameItem]
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0){
                TopRatedSection()
                PopularSection(gameItems: gameItems)
                VStack(alignment: .leading ,spacing: 0){
                    Text("Adventure")
                        .font(.title)
                        .bold()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10){
                            ForEach(gameItems, id: \.title) { gameItem in
                                VStack(alignment:.leading) {
                                    Image(gameItem.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 150, height: 250)
                                        .cornerRadius(10)
                                    Text(gameItem.title)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                    }
                    .frame(height: 320)
                }
                .padding(.horizontal)
            }
            
        }
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView(gameItems: GameItems)
    }
}

struct RectangleIndicators: View {
    var images: [String]
    @Binding var selectedImageIndex: Int
    
    var body: some View {
        HStack {
            Spacer()
            HStack(spacing: 5) {
                ForEach(0..<images.count, id: \.self) { index in
                    Rectangle()
                        .fill(index == selectedImageIndex ? Color(UIColor.label) : Color(UIColor.gray))
                        .frame(width: 30, height: 5)
                        .cornerRadius(5)
                }
            }
            Spacer()
        }
    }
}

struct TopRatedSection: View {
    var images: [String] = ["topRated_1", "topRated_2", "topRated_3", "topRated_4", "topRated_5"]
    @State private var directionForward: Bool = true
    @State private var selectedImageIndex: Int = 0
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Top Rated")
                    .font(.title)
                    .bold()
            }
            .padding(.horizontal)
            
            TabView(selection: $selectedImageIndex) {
                ForEach(0..<images.count, id: \.self) { index in
                    VStack {
                        Image(images[index])
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width - 40, height: 200)
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(10)
                    }
                    .tag(index)
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 200)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .transition(.opacity)
            .onReceive(Timer.publish(every: 6, on: .main, in: .common).autoconnect()) { _ in
                withAnimation {
                    if directionForward {
                        if selectedImageIndex == images.count - 1 {
                            directionForward = false
                            selectedImageIndex -= 1
                        } else {
                            selectedImageIndex += 1
                        }
                    } else {
                        if selectedImageIndex == 0 {
                            directionForward = true
                            selectedImageIndex += 1
                        } else {
                            selectedImageIndex -= 1
                        }
                    }
                }
            }
            RectangleIndicators(images: images, selectedImageIndex: $selectedImageIndex)
        }
    }
}

struct PopularSection: View {
    var gameItems: [GameItem]
    var body: some View {
        VStack(alignment: .leading ,spacing: 0){
            Text("Popular")
                .font(.title)
                .bold()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10){
                    ForEach(gameItems, id: \.title) { gameItem in
                        VStack(alignment:.leading) {
                            Image(gameItem.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 250)
                                .cornerRadius(10)
                            Text(gameItem.title)
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                    }
                }
            }
            .frame(height: 320)
        }
        .padding(.horizontal)
    }
}
