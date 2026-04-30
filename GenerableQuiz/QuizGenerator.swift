import SwiftUI
import FoundationModels

@Observable
class QuizGenerator {
    let topic: String
    var quiz: Quiz.PartiallyGenerated?
    var isGenerating = false

    init(topic: String) {
        self.topic = topic
    }

    func generateQuiz() {
        let session = LanguageModelSession(instructions: "Create a quiz with the provided topic as the focus.")
        let stream = session.streamResponse(to: topic, generating: Quiz.self)

        Task {
            isGenerating = true

            for try await partial in stream {
                self.quiz = partial.content
            }

            isGenerating = false
        }
    }
}
