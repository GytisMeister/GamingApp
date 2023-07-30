import SwiftUI

struct OnboardingView: View {
    @ObservedObject var storyTimer = StoryTimer(items: 3, interval: 3.0)
    @State private var shouldNavigate: Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var onBoardingItems: [OnboardingItem]
    var currentIndex: Int {
        min(Int(self.storyTimer.progress), onBoardingItems.count - 1)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                OnboardingProgressBar(storyTimer: self.storyTimer, onBoardingItems: onBoardingItems)
                VStack{
                    Text(onBoardingItems[currentIndex].title)
                        .font(.title)
                        .bold()
                    Text(onBoardingItems[currentIndex].description)
                        .multilineTextAlignment(.center)
                    ZStack {
                        Image(onBoardingItems[currentIndex].imageName)
                            .resizable()
                            .edgesIgnoringSafeArea(.bottom)
                            .frame(width: .infinity ,alignment: .center)
                            .offset(x: Int(self.storyTimer.progress) == 1 ? -70 : 0)
                            .scaledToFill()
                            .overlay(
                                VStack {
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color(UIColor.systemBackground), Color.white.opacity(0)]),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                    .frame(height: 300)
                                    Spacer()
                                }
                            )
                        StoryNavigation(storyTimer: self.storyTimer, onBoardingItems: onBoardingItems)
                    }
                }
                .onAppear {
                    self.storyTimer.start()
                }
                .onReceive(self.storyTimer.cycleCompleted) { _ in
                    self.shouldNavigate = true
                }
                .onDisappear {
                    self.storyTimer.cancel()
                }
            }
            .background(
                NavigationLink(
                    destination: SignUpView()
                        .navigationBarBackButtonHidden(true),
                    isActive: $shouldNavigate
                ) {
                    EmptyView()
                }
                    .hidden()
            )
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(onBoardingItems: [
            OnboardingItem(imageName: "onboarding_1", title: "Game Deals", description: "Stay updated on the latest game deals and discounts available in the market. Never miss a chance to get your favorite game at a discounted price!"),
            OnboardingItem(imageName: "onboarding_2", title: "News Feed", description: "Stay updated with the latest news, reviews and announcements in the gaming world."),
            OnboardingItem(imageName: "onboarding_3", title: "Gaming Network", description: "Discover new games, connect with other gamers, and stay on top of the latest gaming news.")
        ])
    }
}
