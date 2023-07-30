//
//  GamingAppApp.swift
//  GamingApp
//
//  Created by Gytis Ptašinskas on 2023-07-29.
//

import SwiftUI

@main
struct GamingAppApp: App {
    
    var body: some Scene {
        WindowGroup {
            OnboardingView(onBoardingItems: onboardingItems)
        }
    }
}
