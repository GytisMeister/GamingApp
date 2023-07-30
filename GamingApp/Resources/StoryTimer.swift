import Combine
import SwiftUI

class StoryTimer: ObservableObject {
    @Published var progress: Double = 0.0
    let cycleCompleted = PassthroughSubject<Void, Never>()
    
    private let max: Double
    private let interval: TimeInterval
    private var cancellable: AnyCancellable?
    
    init(items: Int, interval: TimeInterval) {
        self.max = Double(items)
        self.interval = interval
    }
    
    func start() {
        self.cancellable = Timer.publish(every: 0.02, on: .main, in: .default)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                if self.progress < self.max {
                    self.progress += 0.01
                } else {
                    self.cycleCompleted.send()
                    self.cancel()
                }
            }
    }

    func advance(by number: Double) {
        let newProgress = Swift.max((self.progress + number), 0.0)
        if newProgress < self.max {
            self.progress = newProgress
        } else if newProgress >= self.max {
            self.cycleCompleted.send()
        }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}

