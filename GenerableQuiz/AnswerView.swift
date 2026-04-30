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
