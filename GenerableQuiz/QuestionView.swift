import SwiftUI
import FoundationModels

struct QuestionView: View {
    var question: Question.PartiallyGenerated
    @State var selectedAnswer: Answer.PartiallyGenerated?

    var body: some View {
        VStack(alignment: .leading) {
            if let text = question.text {
                HStack {
                    Text(text)

                    Spacer()
                }
            }

            if let answers = question.answers {
                ForEach(answers) { answer in
                    AnswerView(displayAnswer: answer, selectedAnswer: $selectedAnswer)
                }
            }

            if let selectedAnswer = selectedAnswer {
                Text(selectedAnswer.explanation ?? "Generating...")
                    .font(.body.italic())
                    .padding(.top, 8)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    QuestionView(question: Question.sample.asPartiallyGenerated())
}
