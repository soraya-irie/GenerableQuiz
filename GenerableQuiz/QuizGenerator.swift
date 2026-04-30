import SwiftUI

@Observable
class QuizGenerator {
    let topic: String

    init(topic: String) {
        self.topic = topic
    }
}
