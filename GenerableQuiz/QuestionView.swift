import SwiftUI
import FoundationModels

struct QuestionView: View {
    var question: Question.PartiallyGenerated

    var body: some View {
        VStack(alignment: .leading) {
            if let text = question.text {
                HStack {
                    Text(text)

                    Spacer()
                }
            }
        }
    }
}

#Preview {
    QuestionView(question: Question.sample.asPartiallyGenerated())
}
