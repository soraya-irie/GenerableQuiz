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
        }
    }
}

#Preview {
    QuestionView(question: Question.sample.asPartiallyGenerated())
}
