import SwiftUI
import FoundationModels

struct AnswerView: View {
    var displayAnswer: Answer.PartiallyGenerated

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AnswerView(displayAnswer: Answer.correctAnswer.asPartiallyGenerated())
}
