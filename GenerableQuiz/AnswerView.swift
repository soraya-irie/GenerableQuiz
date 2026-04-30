import SwiftUI
import FoundationModels

struct AnswerView: View {
    var displayAnswer: Answer.PartiallyGenerated
    @Binding var selectedAnswer: Answer.PartiallyGenerated?

    var body: some View {
        Button {
            selectedAnswer = displayAnswer
        } label: {
            Text(displayAnswer.text ?? "Generating...")
                .multilineTextAlignment(.leading)
                .foregroundStyle(.primary)
        }
        .buttonStyle(.bordered)
    }

    private var imageName: String {
        if let isAnswerCorrect {
            return isAnswerCorrect ? "checkmark.circle.fill" : "xmark.circle.fill"
        } else {
            return "circle"
        }
    }

    private var isAnswerCorrect: Bool? {
        guard selectedAnswer?.id == displayAnswer.id else { return nil }
        return displayAnswer.isCorrect
    }
}

#Preview {
    @Previewable @State var correctAnswer = Optional(Answer.correctAnswer.asPartiallyGenerated())
    @Previewable @State var incorrectAnswer = Optional(Answer.incorrectAnswer.asPartiallyGenerated())

    VStack {
        AnswerView(displayAnswer: correctAnswer!, selectedAnswer: $incorrectAnswer)
        AnswerView(displayAnswer: correctAnswer!, selectedAnswer: $correctAnswer)
        AnswerView(displayAnswer: incorrectAnswer!, selectedAnswer: $incorrectAnswer)
    }
}
