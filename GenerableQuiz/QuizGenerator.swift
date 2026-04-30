import SwiftUI
import FoundationModels

@Observable
class QuizGenerator {
    let topic: String
    var quiz: Quiz.PartiallyGenerated?
    var isGenerating = false
    var error: Error?

    init(topic: String) {
        self.topic = topic
    }

    func generateQuiz() {
        let session = LanguageModelSession(instructions: "Create a quiz with the provided topic as the focus.")
        let stream = session.streamResponse(to: topic, generating: Quiz.self)

        Task {
            isGenerating = true

            do {
                for try await partial in stream {
                    self.quiz = partial.content
                }
            } catch {
                self.error = error
            }

            isGenerating = false
        }
    }

    func run(session: @escaping () async throws -> Void) {
        Task {
            isGenerating = true

            error = nil
            do {
                try await session()
            } catch {
                self.error = error
            }

            isGenerating = false
        }
    }
}
