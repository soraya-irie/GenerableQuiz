import SwiftUI

@Observable
class QuizGenerator {
    let topic: String
    var quiz: Quiz.PartiallyGenerated?

    init(topic: String) {
        self.topic = topic
    }
}
