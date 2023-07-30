//
//  OnboardingMockupData.swift
//  GamingApp
//
//  Created by Gytis Ptašinskas on 2023-07-29.
//


struct OnboardingItem {
    var imageName: String
    var title: String
    var description: String
}

let onboardingItems: [OnboardingItem] = [
    OnboardingItem(imageName: "onboarding_1",
                   title: "Game Deals",
                   description: "Stay updated on the latest game deals and discounts available in the market. Never miss a chance to get your favorite game at a discounted price!"),
    OnboardingItem(imageName: "onboarding_2",
                   title: "News Feed",
                   description: "Stay updated with the latest news, reviews and announcements in the gaming world."),
    OnboardingItem(imageName: "onboarding_3",
                   title: "Gaming Network",
                   description: "Discover new games, connect with other gamers, and stay on top of the latest gaming news.")
]
