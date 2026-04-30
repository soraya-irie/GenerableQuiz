import Foundation
import FoundationModels

@Generable
struct Answer: Identifiable {
    let id = UUID()

    @Guide(description: "The display text of the answer.")
    let text: String

    @Guide(description: "Whether this is the correct answer or not.")
    let isCorrect: Bool

    @Guide(description: "Why is this answer correct or incorrect.")
    let explanation: String
}
