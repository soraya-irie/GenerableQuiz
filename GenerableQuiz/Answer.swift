import Foundation

struct Answer: Identifiable {
    let id = UUID()

    let text: String

    let isCorrect: Bool

    let explanation: String
}
