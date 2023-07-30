//
//  OnboardingProgressBar.swift
//  GamingApp
//
//  Created by Gytis Ptašinskas on 2023-07-29.
//

import SwiftUI

struct OnboardingProgressBar: View {
    @ObservedObject var storyTimer: StoryTimer
    var onBoardingItems: [OnboardingItem]
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            ForEach(Array(self.onBoardingItems.indices), id: \.self) { x in
                withAnimation(.linear(duration: 0.01)) { // updated this line
                    LoadingRectangle(progress: min( max( (CGFloat(self.storyTimer.progress) - CGFloat(x)), 0.0) , 1.0) )
                        .frame(width: nil, height: 6, alignment: .leading)
                }
            }
        }.padding()
    }
}

