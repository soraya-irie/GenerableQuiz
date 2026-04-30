import SwiftUI
import FoundationModels

@Observable
class QuizGenerator {
    let topic: String
    var quiz: Quiz.PartiallyGenerated?

    init(topic: String) {
        self.topic = topic
    }

    func generateQuzi() {
        let session = LanguageModelSession(instructions: "Create a quiz with the provided topic as the focus.")
        let stream = session.streamResponse(to: topic, generating: Quiz.self)

        Task {
            for try await partial in stream {
                self.quiz = partial.content
            }
        }
    }
}
