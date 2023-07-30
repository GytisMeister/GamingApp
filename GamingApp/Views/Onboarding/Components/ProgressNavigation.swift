//
//  ProgressNavigation.swift
//  GamingApp
//
//  Created by Gytis Ptašinskas on 2023-07-29.
//
import SwiftUI

struct StoryNavigation: View {
    @ObservedObject var storyTimer: StoryTimer = StoryTimer(items: 3, interval: 3.0)
//    var imageNames:[String] = ["onboarding_1","onboarding_2","onboarding_3"]
    var onBoardingItems: [OnboardingItem]
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Rectangle()
                .foregroundColor(.clear)
                .contentShape(Rectangle())
                .onTapGesture {
                    self.storyTimer.advance(by: -1)
                }
            Rectangle()
                .foregroundColor(.clear)
                .contentShape(Rectangle())
                .onTapGesture {
                    if Int(self.storyTimer.progress) < self.onBoardingItems.count - 1 {
                        self.storyTimer.advance(by: 1)
                    }
                }
        }
    }
}
